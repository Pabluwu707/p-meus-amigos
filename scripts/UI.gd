extends Node2D

@export var VidaCounter : TextEdit
@export var MoneyCounter : TextEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setup_ui(maxlife, currentmoney):
	VidaCounter.setup_vida(maxlife)
	MoneyCounter.setup_dinero(currentmoney)

func change_vida(value):
	VidaCounter.change_vida(value)
