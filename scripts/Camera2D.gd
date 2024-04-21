extends Camera2D

@export var PlayerNode : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	#set_position(PlayerNode.get_position())
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#if PlayerNode.get_position().x > 500:
		#set_position(PlayerNode.get_position())
