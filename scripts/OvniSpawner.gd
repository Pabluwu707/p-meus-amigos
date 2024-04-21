extends Area2D

func _on_body_entered(other):
	print("OVNI")
	spawn_ovni()
	
func spawn_ovni():
	var ovni = preload("res://scenes/ovni_hazard.tscn").instantiate()
	get_parent().add_child(ovni)
	ovni.global_position = %Point.global_position
	queue_free()
