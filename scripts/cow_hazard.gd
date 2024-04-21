extends RigidBody2D

const SPEED = 700
var rng = RandomNumberGenerator.new()
var direction = Vector2(1, 0)

func _ready():
	#set_collision_layer_value(2, false)
	gravity_scale = 0
	pass
	
func _process(delta):
	rotate(0.5*delta)
	
func _physics_process(delta):
	#move_and_collide(direction*SPEED)
	var collide_info = move_and_collide(direction*SPEED*delta)
