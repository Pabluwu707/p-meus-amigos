extends Node

@onready var game_controller := $LevelController
@onready var player := $Player
@onready var player_camera := $Player/Camera2D
@onready var ui := $CanvasLayer/UI

var global = Global

# Start the game
func _ready():
	print("COMIENZA")
	game_controller.setup_level(Global.current_max_vida,Global.current_dinero)
	ui.setup_ui(Global.current_max_vida,Global.current_dinero, player.get_position().x)
	_connect_player_damage()


func _connect_player_damage():
	player.player_collisions_with_hazard.connect(game_controller.handle_damage)
	game_controller.update_life_ui.connect(ui.change_vida)


func _on_area_2d_body_entered(body):
	get_node("Player").playable = false
