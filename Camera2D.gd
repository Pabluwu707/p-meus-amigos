extends Camera2D

@export var PlayerNode : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_position(PlayerNode.get_position())	
	
