extends StaticBody2D

const SPEED = 300

var frequency = 5
var amplitude = 500
var time = 0
 
func _physics_process(delta):
	time += delta
	var movement = cos(time*frequency)*amplitude
	position.x += movement * delta
	position.y += - delta * SPEED
