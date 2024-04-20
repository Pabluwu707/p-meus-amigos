extends TextEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setup_vida(maxlife):
	# de normal cambiariamos la animacion y ya, como estamos de debug cambio el texto
	print("Establecemos vida inicial")
	text = str(maxlife)
	
func change_vida(value):
	# de normal cambiariamos la animacion y ya, como estamos de debug cambio el texto
	text = str(value)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
