extends Area2D

var activated = false

func _on_body_entered(other):
	#if other.typeof("Player"):
	print("AAAAAAAAAAAAAAAH")
	if !activated:
		activated = true
		spawn_cow()
	
func spawn_cow():
	var cow = preload("res://scenes/cow_hazard.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	get_parent().add_child(cow)
	cow.global_position = %PathFollow2D.global_position
	queue_free()
