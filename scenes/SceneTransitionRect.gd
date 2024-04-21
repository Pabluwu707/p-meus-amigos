extends Control

@export_file("*.tscn") var level0: String
@export_file("*.tscn") var level1: String
@export_file("*.tscn") var level2: String
@export_file("*.tscn") var level3: String

@onready var animation_player := $AnimationPlayer
@onready var black_rect := $BlackRect
@onready var white_rect := $WhiteRect


func to_level() -> void:
	# Plays the Fade animation and wait until it finishes
	black_rect.visible = true
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

# TODO: remove
func _wait():
	var t = Timer.new()
	t.set_wait_time(3)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	await t.timeout
