extends Node

@onready var game_controller := $LevelController
@onready var player := $Player
@onready var player_camera := $Player/Camera2D
@onready var ui := $CanvasLayer/UI

# Start the game
func _ready():
	#game_state.start_game()
	print("COMIENZA")
	game_controller.setup_level(5,100)
	ui.setup_ui(5, 100)
	_connect_player_damage()


func _connect_player_damage():
	player.player_collisions_with_hazard.connect(game_controller.handle_damage)
	game_controller.update_life_ui.connect(ui.change_vida)
	print("CONECT")
