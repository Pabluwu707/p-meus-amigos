extends Node2D

func _ready():
	if Global.current_dinero >= 350:
		%Bad.queue_free()
	else:
		%Good.queue_free()
