extends Node2D

var started = false
var tittle = false

func _process(delta):
	
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if (direction.length() > 0):
		started = true
	
	if started:
		%ColorRect.modulate.a -= delta
		%Arrows.modulate.a -= delta
	if tittle:
		%Titulo.modulate.a += delta*0.3
		%Go.modulate.a -= delta


func _on_area_2d_body_entered(body):
	tittle = true
