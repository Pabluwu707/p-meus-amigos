extends Node2D

func on_create(alien: String, reward, damage, sentence):
	%Name.text = alien
	%Reward.text = str(reward)
	%Damage.text = str(damage)
	%Total.text = str(reward - damage)
	%Sentence.text = sentence

func _ready():
	#on_create("Xokulon", 100, 25, "qe dise")
	pass
