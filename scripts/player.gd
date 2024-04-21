extends CharacterBody2D

const MAX_SPEED = 7.5
const ACCELERATION = 2.0
const RESISTANCE = 2.0
const BREAK_BONUS = 10.0
const GRACE_PERIOD = 3.0 #in seconds

var momentum = Vector2(0, 0)
var in_knockback = false
var invencible = false
var playable = true

signal player_collisions_with_hazard

@onready var player_animation := $AnimationPlayer
@onready var animation_tree := $AnimationTree

func are_oposite_numbers(n1: float, n2: float):
	if (n1 > 0 and n2 < 0):
		return true
	if (n1 < 0 and n2 > 0):
		return true
	return false

func are_oposite_vectors(v1: Vector2, v2: Vector2):
	if abs(v1.angle_to(v2)) > PI / 2 * 1.5:
		return true
	else:
		return false

func _physics_process(delta):
	
	var collision_info = move_and_collide(velocity)
	
	if collision_info:
		#velocity = velocity.bounce(collision_info.get_normal())
		velocity = -velocity
		momentum = momentum.rotated(momentum.angle_to(velocity)) * 0.7
		on_knockback()
	
	if position.x < -50 or position.y < 0 or position.y > 950:
		velocity = -velocity
		momentum = momentum.rotated(momentum.angle_to(velocity)) * 0.7
		on_wall_knockback()
		
	elif playable:
		var direction = Input.get_vector("left", "right", "up", "down")
		
		if (in_knockback or !playable):
			direction = Vector2(0, 0)
		
		var break_bonus = 1
		if are_oposite_vectors(direction, velocity):
			break_bonus = BREAK_BONUS
		
		momentum += direction * delta * ACCELERATION * break_bonus
		
		if momentum.length() > 1.0:
			momentum = momentum.normalized()
			
		if direction.length() == 0:
			momentum -= momentum * RESISTANCE * delta

		velocity = momentum * MAX_SPEED

func on_wall_knockback():
	in_knockback = true
	%KnockbackTimer.start()

func on_knockback():
	if (!invencible):
		%GracePeriodTimer.start()
		%FlickTimer.start()
		visible = false
		invencible = true
		
	in_knockback = true
	%KnockbackTimer.start()

func _on_knockback_timer_timeout():
	in_knockback = false

func _on_grace_period_timer_timeout():
	invencible = false
	visible = true
	%FlickTimer.stop()

func _process(delta):
	update_animation_parameters()

func update_animation_parameters():
	var move_input_x = Input.get_action_strength("left") - Input.get_action_strength("right")
	var move_input_y = Input.get_action_strength("up") - Input.get_action_strength("down")
	if (move_input_x == 0 && move_input_y == 0):
		animation_tree["parameters/conditions/is_idle"] = true
		animation_tree["parameters/conditions/is_moving_recto"] = false
		animation_tree["parameters/conditions/is_moving_down"] = false
		animation_tree["parameters/conditions/is_moving_up"] = false
	elif (move_input_x != 0 && move_input_y == 0):
		animation_tree["parameters/conditions/is_moving_recto"] = true
		animation_tree["parameters/conditions/is_idle"] = false
		animation_tree["parameters/conditions/is_moving_down"] = false
		animation_tree["parameters/conditions/is_moving_up"] = false
	elif (move_input_y > 0):
		animation_tree["parameters/conditions/is_moving_up"] = true
		animation_tree["parameters/conditions/is_idle"] = false
		animation_tree["parameters/conditions/is_moving_recto"] = false
		animation_tree["parameters/conditions/is_moving_down"] = false
	elif (move_input_y < 0):
		animation_tree["parameters/conditions/is_moving_down"] = true
		animation_tree["parameters/conditions/is_idle"] = false
		animation_tree["parameters/conditions/is_moving_recto"] = false
		animation_tree["parameters/conditions/is_moving_up"] = false


func _on_flick_timer_timeout():
	visible = !visible


func _on_respawn_timer_timeout():
	print(position.y)
	if position.x < -49 or position.y < 0 or position.y > 951:
		position.y = 400
		on_knockback()
