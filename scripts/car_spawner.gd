extends Area2D

var player
var spawn_position = randf()
var sign = preload("res://scenes/warning_sign.tscn").instantiate()

func _ready():
	player  = get_parent().get_node("CanvasLayer")

func _on_body_entered(body):
	print("tocado")
	%PathFollow2D.progress_ratio = spawn_position
	sign.global_position = %PathFollow2D.global_position
	player.add_child(sign)
	queue_free()
