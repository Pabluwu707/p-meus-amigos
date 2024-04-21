extends Area2D

var activated = false

func _on_body_entered(other):
	#if other.typeof("Player"):
	print("PLAYERCOLLIDE")
	if !activated:
		activated = true
		spawn_comet()
	
func spawn_comet():
	var comet = preload("res://scenes/comet_hazard.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	get_parent().add_child(comet)
	comet.global_position = %PathFollow2D.global_position
	queue_free()
