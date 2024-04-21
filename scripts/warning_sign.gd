extends Node2D

var running = true

func _ready():
	%SpawnTimer.start()
	
func _process(delta):
	print(global_position)

func spawn_car():
	var car = preload("res://scenes/car_hazard.tscn").instantiate()
	get_parent().get_parent().add_child(car)
	car.global_position = global_position
	car.global_position.x = get_parent().get_parent().get_node("Player").global_position.x + 900
	queue_free()


func _on_spawn_timer_timeout():
	running = false
	spawn_car()
