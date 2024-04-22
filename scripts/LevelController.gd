extends Node2D

@export var MaxLife : int
@export var CurrentLife : int
@export var Reward : int

signal update_life_ui(life: int)

func setup_level(life, money):
	print("Setting everything up... Life and money to set up: ")
	print(life)
	print(money)
	MaxLife = life
	CurrentLife = life
	Reward = money

func handle_damage():
	if (CurrentLife > 0):
		CurrentLife -= 1
	update_life_ui.emit(CurrentLife)
	print(CurrentLife)

