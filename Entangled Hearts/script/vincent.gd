extends CharacterBody3D
var in_dialogue : bool = false

func _ready():
	var layout = Dialogic.start("1boulevard")
	layout.register_character(load("res://character/vincent1.dch"), $".")
	pass
	
func DialogicSignal(arg: String):
	if arg == "next1":
		get_tree().change_scene_to_file("res://scenes/loading_scene.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/loading_scene.tscn")


	move_and_slide()
