extends Control

@onready var transition = $Transition
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_newgame_pressed() -> void:
	transition.play("FadeOut")
	get_tree().change_scene_to_file("res://scenes/1_1Vergil_Dream.tscn")


func _on_load_pressed() -> void:
	print("Load")


func _on_selectscene_pressed() -> void:
	print("Select scene")


func _on_settings_pressed() -> void:
	print("Settings")


func _on_quit_pressed() -> void:
	get_tree().quit()
