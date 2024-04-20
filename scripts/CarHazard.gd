extends CharacterBody2D

const SPEED = 1000
var direction = Vector2.LEFT

func _ready():
	#set_collision_layer_value(2, false)
	pass
	
func _physics_process(delta):
	#move_and_collide(direction*SPEED)
	var collide_info = move_and_collide(direction*SPEED*delta)
	
	if (collide_info):
		print("ayyyyyyy")
		set_collision_layer_value(2, false)
