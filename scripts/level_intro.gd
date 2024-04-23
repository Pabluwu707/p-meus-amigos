extends Node2D

var started = false
var tittle = false

func _start():
	Global.dia= 0
	Global.current_dinero = 0
	Global.current_veces_dano = 0

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
	%NextSceneTimet.start()
	GlobalAudioStreamPlayer.play_opening()


func _on_next_scene_timet_timeout():
	# %AudioStreamPlayer.stop()
	Global.dia= 0
	Global.current_dinero = 0
	Global.current_veces_dano = 0
	
	Global.mision_tutorial.usado = false
	Global.misiones_facil[0].usado = false
	Global.misiones_facil[1].usado = false
	Global.misiones_facil[2].usado = false
	Global.misiones_normal[0].usado = false
	Global.misiones_normal[1].usado = false
	Global.misiones_normal[2].usado = false
	Global.misiones_dificil[0].usado = false
	Global.misiones_dificil[1].usado = false
	Global.misiones_dificil[2].usado = false
	SceneTransition.to_opening()
	# HACER AQUÍ LA SIGUIENTE ESCENA
