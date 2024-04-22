extends Node2D

func setup_boton(nombrealien, nombrepaquete, imagenpaquete, dificultad, recompensa):
	%NombreAlien.text = nombrealien
	%NombrePaquete.text = nombrepaquete
	var imagen = load("res://scenes/alien/" + imagenpaquete +  ".tscn").instantiate()
	add_child(imagen)
	imagen.position = Vector2(1029,810)
	if (dificultad == 5):
		%Dificultad.text = "ROBUSTO(♥♥♥♥♥)"
	elif (dificultad == 4):
		%Dificultad.text = "ROBUSTO(♥♥♥♥)"
	elif (dificultad == 3):
		%Dificultad.text = "ESTÁNDAR(♥♥♥)"
	else:
		%Dificultad.text = "FRÁGIL(♥♥)"
	%Recompensa.text = recompensa
