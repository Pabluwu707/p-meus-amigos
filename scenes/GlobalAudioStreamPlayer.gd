extends AudioStreamPlayer

@onready var animation := $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play_opening():
	self.volume_db = 0
	self.stream = load("res://assets/cine_inicio_o_menu.wav")
	self.play()

func play_nivel():
	self.volume_db = 0
	self.stream = load("res://assets/nivel.wav")
	self.play()

func fade_out_music():
	animation.play("fade_out_volumen")
	
func stop_music():
	self.stop()
