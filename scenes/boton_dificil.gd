extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setup_boton(nombrealien, nombrepaquete, imagenpaquete, dificultad, recompensa):
	%NombreAlien.text = nombrealien
	%NombrePaquete.text = nombrepaquete
	#%ImagenPaquete.texture = imagenpaquete
	if (dificultad == 5):
		%Dificultad.text = "ROBUSTO(♥♥♥♥♥)"
	elif (dificultad == 4):
		%Dificultad.text = "ROBUSTO(♥♥♥♥)"
	elif (dificultad == 3):
		%Dificultad.text = "ESTÁNDAR(♥♥♥)"
	else:
		%Dificultad.text = "FRÁGIL(♥♥)"
	%Recompensa.text = recompensa
