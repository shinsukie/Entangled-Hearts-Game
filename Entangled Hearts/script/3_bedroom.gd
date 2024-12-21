extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Transition.play("FadeIn")


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_to_school_body_entered(body: Node2D) -> void:
	if body is Vergil:
		get_tree().change_scene_to_file("res://scenes/loading_scene.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://ui.tscn")
