extends ProgressBar

var Player : CharacterBody2D
var inicio_jugador : int
var distancia_meta : int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value = ((Player.get_position().x - inicio_jugador) / distancia_meta) * 100
	%PathFollow2D.progress_ratio = value / 100

func setup_distancia(player, meta, initialposition):
	print(initialposition)
	Player = player
	inicio_jugador = initialposition
	distancia_meta = meta.get_position().x - inicio_jugador
