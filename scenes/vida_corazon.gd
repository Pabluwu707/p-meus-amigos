extends Node2D

@onready var animationplayer = $AnimationPlayer

func play_dead():
	if (animationplayer.current_animation != "muerto"):
		animationplayer.play("muerto")
		
func play_alive():
	if (animationplayer.current_animation != "vivo"):
		animationplayer.play("vivo")
