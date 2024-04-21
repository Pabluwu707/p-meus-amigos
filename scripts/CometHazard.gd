extends CharacterBody2D

const SPEED = 250
var rng = RandomNumberGenerator.new()
var random_rotation = rng.randf_range(-PI/4, 0)
var direction = Vector2(0, 1).rotated(random_rotation)

func _ready():
	global_rotation = random_rotation
	#velocity = direction
	#gravity_scale = 0
	#add_constant_central_force(direction * SPEED)
	
func _physics_process(delta):
	#move_and_collide(direction*SPEED)
	move_and_collide(direction*SPEED*delta)
