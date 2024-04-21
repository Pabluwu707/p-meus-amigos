extends Node

@onready var animaflecha := $"Selector movil/AnimationPlayer"
@onready var SceneTransition := $SceneTransition

var escenabotonfacil = preload("res://scenes/boton_facil.tscn")
var escenabotonmedio = preload("res://scenes/boton_normal.tscn")
var escenabotondificil = preload("res://scenes/boton_dificil.tscn")

var misionfacil
var misionnormal 
var misiondificil

var selected = 1


# Called when the node enters the scene tree for the first time.
func _ready():
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
					Global.current_max_vida = misionfacil.dificultad
					Global.current_recompensa = misionfacil.recompensa
					SceneTransition.to_level()
				1:
					print("Cargar nivel normal")
					Global.current_max_vida = misionnormal.dificultad
					Global.current_recompensa = misionnormal.recompensa
					SceneTransition.to_level()
				2:
					print("Cargar nivel dificil")
					Global.current_max_vida = misiondificil.dificultad
					Global.current_recompensa = misiondificil.recompensa
					SceneTransition.to_level()
					

func setup_botones():
	var dia = Global.dia
	if (dia == 0):
		var n = 0
		misionnormal = Global.misiones_facil[n]
		while true:
			if (misionnormal.nombre_alien == "Melvin"):
				print("Encontrado Melvin")
				break
			else:
				print("Que no es asi merluzo. Este es: ")
				print(misionnormal.nombre_alien)
				n = n+1
				misionnormal = Global.misiones_facil[n]
		
		var boton = escenabotonfacil.instantiate()
		boton.setup_boton(misionnormal.nombre_alien, misionnormal.nombre_paquete, misionnormal.imagen_paquete, misionnormal.dificultad, misionnormal.recompensa)
		#boton.position = Vector2(220+(n*80),107)
		add_child(boton)
	else:
		
		var nf = 0
		misionfacil = Global.misiones_facil[nf]
		while true:
			if (misionfacil.usado == false):
				print("Encontrado uno sin usar")
				break
			else:
				print("Este es: ")
				print(misionfacil.nombre_alien)
				nf = nf+1
				misionfacil = Global.misiones_facil[nf]
		var botonf = escenabotonfacil.instantiate()
		botonf.setup_boton(misionfacil.nombre_alien, misionfacil.nombre_paquete, misionfacil.imagen_paquete, misionfacil.dificultad, misionfacil.recompensa)
		#boton.position = Vector2(220+(n*80),107)
		add_child(botonf)

		var nn = 0
		misionnormal = Global.misiones_normal[nn]
		while true:
			if (misionnormal.usado == false):
				print("Encontrado uno sin usar")
				break
			else:
				print("Este es: ")
				print(misionnormal.nombre_alien)
				nn = nn + 1
				misionnormal = Global.misiones_normal[nn]
		var botonn = escenabotonmedio.instantiate()
		botonn.setup_boton(misionnormal.nombre_alien, misionnormal.nombre_paquete, misionnormal.imagen_paquete, misionnormal.dificultad, misionnormal.recompensa)
		#boton.position = Vector2(220+(n*80),107)
		add_child(botonn)

		var nd = 0
		misiondificil = Global.misiones_dificil[nd]
		while true:
			if (misiondificil.usado == false):
				print("Encontrado uno sin usar")
				break
			else:
				print("Este es: ")
				print(misiondificil.nombre_alien)
				nd = nd + 1
				misiondificil = Global.misiones_dificil[nd]
		var botond = escenabotondificil.instantiate()
		botond.setup_boton(misiondificil.nombre_alien, misiondificil.nombre_paquete, misiondificil.imagen_paquete, misiondificil.dificultad, misiondificil.recompensa)
		#boton.position = Vector2(220+(n*80),107)
		add_child(botond)
