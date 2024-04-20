extends Node2D

@export var MaxLife : int
@export var CurrentLife : int
@export var Reward : int


signal update_life_ui(life: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func setup_level(life, money):
	print("Setting everything up... Life and money to set up: ")
	print(life)
	print(money)
	MaxLife = life
	CurrentLife = life
	Reward = money

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("spacebar"):
		print("OUCH")
		handle_damage()

func handle_damage():
	if (CurrentLife > 0):
		CurrentLife -= 1
	update_life_ui.emit(CurrentLife)
	print(CurrentLife)

func load_results():
	# Disable player movement
	# Enable visibility of menu
	pass
	
