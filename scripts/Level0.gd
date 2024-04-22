extends Node

@onready var game_controller := $LevelController
@onready var player := $Player
@onready var player_camera := $Player/Camera2D
@onready var ui := $CanvasLayer/UI

var global = Global
var level_completed

func _process(delta):
	if %AudioStreamPlayer.playing == false and get_node("Player").playable:
		%AudioStreamPlayer.play()

# Start the game
func _ready():
	print("COMIENZA")
	level_completed = false
	%AudioStreamPlayer.play()
	game_controller.setup_level(Global.current_mision.dificultad,Global.current_dinero)
	ui.setup_ui(Global.current_mision.dificultad,Global.current_dinero, player.get_position().x)
	_connect_player_damage()
	Global.current_veces_dano = 0


func _connect_player_damage():
	player.player_collisions_with_hazard.connect(game_controller.handle_damage)
	game_controller.update_life_ui.connect(ui.change_vida)

func _input(event):
	if (event.is_action_pressed("spacebar")):
		if (level_completed):
			Global.dia = Global.dia + 1
			Global.current_veces_dano = 0
			if (Global.dia == 4):
				SceneTransition.to_victory()
			else:
				SceneTransition.to_menu()

func _on_area_2d_body_entered(body):
	get_node("Player").playable = false
	%Victory.play()
	%AudioStreamPlayer.stop()
	
	var name_alien = Global.current_mision.nombre_alien
	var reward = Global.current_mision.recompensa
	var damage = Global.current_veces_dano 
	var frase = Global.current_mision.mensaje
	var sprite = Global.current_mision.imagen_alien
	var resultados = load("res://scenes/result_screen.tscn").instantiate()
	resultados.on_create(name_alien, reward, damage, frase, sprite)
	resultados.position = Vector2(650, 490)
	ui.add_child(resultados)
	
	level_completed = true
	
	
