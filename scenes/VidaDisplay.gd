extends Node2D

var corazonesnodo = preload("res://scenes/vida_corazon.tscn")
var array_corazones = []
var num_vidas : int

func setup_vida(maxlife):
	# de normal cambiariamos la animacion y ya, como estamos de debug cambio el texto
	print("Establecemos vida inicial")
	num_vidas = maxlife
	for n in maxlife:
		print(n)
		var instance = corazonesnodo.instantiate()
		array_corazones.push_back(instance)
		instance.position = Vector2(220+(n*80),107)
		add_child(instance)

func change_vida(value):
	if(num_vidas > 0):
		num_vidas = num_vidas - 1
		array_corazones[num_vidas].play_dead()
