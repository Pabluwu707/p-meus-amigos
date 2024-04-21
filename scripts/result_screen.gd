extends Node2D

func on_create(alien: String, reward, damage, sentence, portrait):
	%Name.text = alien
	%Reward.text = str(reward)
	%Damage.text = str(damage)
	%Total.text = str(reward - damage)
	%Sentence.text = sentence
	var portrait_node = load("res://scenes/" + portrait +  ".tscn").instantiate()
	add_child(portrait_node)
	portrait_node.position = %PortraitPlace.position
func _ready():
	#on_create("Xokulon", 100, 25, "qe dise", "asteroid_hazard")
	pass
