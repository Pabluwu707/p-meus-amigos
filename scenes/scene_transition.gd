extends CanvasLayer

@export_file("*.tscn") var level0: String
@export_file("*.tscn") var level1: String
@export_file("*.tscn") var level2: String
@export_file("*.tscn") var level3: String
@export_file("*.tscn") var menu: String
@export_file("*.tscn") var ending: String

@onready var animation_player := $AnimationPlayer

func to_level() -> void:
	# Plays the Fade animation and wait until it finishes
	animation_player.play("fade")
	await animation_player.animation_finished
	# Changes the scene
	var currente_day = Global.dia
	match currente_day:
		0:
			get_tree().change_scene_to_file(level0)
		1:
			get_tree().change_scene_to_file(level1)
		2:
			get_tree().change_scene_to_file(level2)
		3:
			get_tree().change_scene_to_file(level3)
	animation_player.play_backwards("fade")


func to_menu() -> void:
	# Plays the Fade animation and wait until it finishes
	animation_player.play("fade")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(menu)
	animation_player.play_backwards("fade")

func to_victory() -> void:
	# Plays the Fade animation and wait until it finishes
	animation_player.play("fade")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(ending)
	animation_player.play_backwards("fade")
