extends Node2D

var next_action = ""
var previous_action = ""
var current_slide: int = 0

signal end_cutscene

func _ready():
	for child in get_children():
		child.visible = false
	get_children()[0].visible = true
	configure("right", "left")

func configure(nxt: String, prv: String):
	next_action = nxt
	previous_action = prv

func _process(delta):
	
	if get_children()[current_slide].get_child(0).has_node("AnimationPlayer"):
		get_children()[current_slide].get_child(0).play("default")
	
	if Input.is_action_just_pressed(next_action):
		if (current_slide+1 == get_children().size()):
			end_cutscene.emit()
			queue_free()
		else:
			get_children()[current_slide].visible = false
			get_children()[current_slide+1].visible = true
			current_slide += 1
		
	if Input.is_action_just_pressed(previous_action) && current_slide-1 >= 0:
		get_children()[current_slide].visible = false
		get_children()[current_slide-1].visible = true
		current_slide -= 1
	
	
