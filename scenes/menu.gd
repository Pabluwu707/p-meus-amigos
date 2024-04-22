extends Node

@onready var animaflecha := $"Selector movil/AnimationPlayer"

var escenabotonfacil = preload("res://scenes/boton_facil.tscn")
var escenabotonmedio = preload("res://scenes/boton_normal.tscn")
var escenabotondificil = preload("res://scenes/boton_dificil.tscn")

var misionfacil
var misionnormal 
var misiondificil

var selected = 1

@onready var diatexto = $DiaTexto

# Called when the node enters the scene tree for the first time.
func _ready():
	var text = "DÍA %s"
	diatexto.text = text % str(Global.dia+1)
	setup_botones()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if (Global.dia != 0):
		if (event.is_action_pressed("ui_down") && selected < 2):
			selected = selected + 1
			animaflecha.play(str(int(animaflecha.current_animation) + 1))
		
		if (event.is_action_pressed("ui_up") && selected > 0):
			selected = selected - 1
			animaflecha.play(str(int(animaflecha.current_animation) - 1))
		
		if (event.is_action_pressed("spacebar")):
			match selected:
				0:
					print("Cargar nivel facil")
					Global.current_mision = misionfacil
					SceneTransition.to_level()
				1:
					print("Cargar nivel normal")
					Global.current_mision = misionnormal
					SceneTransition.to_level()
				2:
					print("Cargar nivel dificil")
					Global.current_mision = misiondificil
					SceneTransition.to_level()
	else:
		if (event.is_action_pressed("spacebar")):
			print("Cargar nivel facil")
			Global.current_mision = misionfacil
			SceneTransition.to_level()
					
func setup_botones():
	var dia = Global.dia
	if (dia == 0):
		var n = 0
		misionfacil = Global.mision_tutorial
		
		var boton = escenabotonfacil.instantiate()
		boton.setup_boton(misionfacil.nombre_alien, misionfacil.nombre_paquete, misionfacil.imagen_paquete, misionfacil.dificultad, misionfacil.recompensa)
		add_child(boton)
		
		selected = 0
		animaflecha.play("0")
		
	else:
		
		var nf = 0
		misionfacil = Global.misiones_facil[nf]
		while true:
			if (misionfacil.usado == false):
				# print("Encontrado uno sin usar")
				Global.misiones_facil[nf].usado = true
				break
			else:
				nf = nf+1
				misionfacil = Global.misiones_facil[nf]
		
		var botonf = escenabotonfacil.instantiate()
		botonf.setup_boton(misionfacil.nombre_alien, misionfacil.nombre_paquete, misionfacil.imagen_paquete, misionfacil.dificultad, misionfacil.recompensa)
		add_child(botonf)

		var nn = 0
		misionnormal = Global.misiones_normal[nn]
		while true:
			if (misionnormal.usado == false):
				Global.misiones_normal[nn].usado = true
				# print("Encontrado uno sin usar")
				break
			else:
				nn = nn + 1
				misionnormal = Global.misiones_normal[nn]
		var botonn = escenabotonmedio.instantiate()
		botonn.setup_boton(misionnormal.nombre_alien, misionnormal.nombre_paquete, misionnormal.imagen_paquete, misionnormal.dificultad, misionnormal.recompensa)
		add_child(botonn)

		var nd = 0
		misiondificil = Global.misiones_dificil[nd]
		while true:
			if (misiondificil.usado == false):
				# print("Encontrado uno sin usar")
				Global.misiones_dificil[nd].usado = true
				break
			else:
				nd = nd + 1
				misiondificil = Global.misiones_dificil[nd]

		var botond = escenabotondificil.instantiate()
		botond.setup_boton(misiondificil.nombre_alien, misiondificil.nombre_paquete, misiondificil.imagen_paquete, misiondificil.dificultad, misiondificil.recompensa)
		add_child(botond)
