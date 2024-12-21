extends CharacterBody3D
var in_dialogue : bool = false

func _ready():
	var layout = Dialogic.start("boulevard2")
	layout.register_character(load("res://character/vincent1.dch"), $".")
	pass
	


	move_and_slide()
