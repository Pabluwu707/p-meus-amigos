extends RigidBody2D

const SPEED = 250
var rng = RandomNumberGenerator.new()
var random_rotation = rng.randf_range(-PI/4, PI/4)
var direction = Vector2(0, 1).rotated(random_rotation)

func _ready():
	global_rotation = random_rotation
	#velocity = direction
	gravity_scale = 0
	add_constant_central_force(Vector2.DOWN)
	
