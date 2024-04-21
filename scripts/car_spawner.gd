extends Area2D

var player
var canvas
var spawn_position = randf()
var sign = preload("res://scenes/warning_sign.tscn").instantiate()

func _ready():
	canvas = get_parent().get_node("CanvasLayer")
	player = get_parent().get_node("Player")

func _on_body_entered(body):
	print("tocado")
	%PathFollow2D.progress = player.position.y
	sign.position = %PathFollow2D.position
	canvas.add_child(sign)
	queue_free()
