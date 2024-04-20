extends CharacterBody2D

const SPEED = 250
var rng = RandomNumberGenerator.new()
var random_rotation = rng.randf_range(-PI/4, PI/4)
var direction = Vector2(0, 1).rotated(random_rotation)

func _ready():
	global_rotation = random_rotation
	velocity = direction
	
func _physics_process(delta):
	
	var collision_info = move_and_collide(velocity * delta * SPEED)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
