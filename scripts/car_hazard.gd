extends Area2D

const SPEED = 1500
var direction = Vector2.LEFT

func _ready():
	#set_collision_layer_value(2, false)
	pass
	
func _physics_process(delta):
	position.x += -SPEED * delta
