extends CanvasLayer

@onready var animacion := $Animacion/AnimationPlayer
@onready var textoending := $TextoEnding

var dinero = 0
var frase1 = "Con %s Euros Espaciales en la cartera, corres a la tienda de juegos..."
var frase2 = "¡FELICIDADES! ¡Tras una semana de duro trabajo, es hora de disfrutar de tu nueva y flamante Wii Universe! GOOD ENDING"

# Called when the node enters the scene tree for the first time.
func _ready():
	dinero = Global.current_dinero
	frase1 = frase1 % str(dinero)
	textoending.text = frase1
	animacion.play("1")


func _input(event):
	if event.is_action_pressed("left"):
		if(animacion.current_animation == "2"):
			animate_previous_page()
	if event.is_action_pressed("right"):
		if(animacion.current_animation != "1"):
			animate_next_page()
		
	if event.is_action_pressed("spacebar"):
		print(animacion.current_animation)
		if(animacion.current_animation == "2"):
			transition_into_new_game()
		else:	
			animate_next_page()


func animate_previous_page() -> void:
	var current = animacion.current_animation
	if (current == "2"):
		animacion.play("1")
	textoending.text = frase1

func animate_next_page() -> void:
	var current = animacion.current_animation
	if (current != "2"):
		animacion.play("2")
	textoending.text = frase2


func transition_into_new_game():
	SceneTransition.to_start()
