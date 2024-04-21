extends Node2D

@onready var VidaCounter := $VidaDisplay/VidaDisplayTexto
@onready var MoneyCounter := $DineroDisplay
@onready var DistanciaCounter := $DistanciaDisplay/ProgressBar

@export var Player : CharacterBody2D
@export var Meta : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setup_ui(maxlife, currentmoney, intialposition):
	VidaCounter.setup_vida(maxlife)
	MoneyCounter.setup_dinero(currentmoney)
	DistanciaCounter.setup_distancia(Player, Meta, intialposition)
	

func change_vida(value):
	VidaCounter.change_vida(value)
