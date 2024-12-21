extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Transition.play("FadeIn")



func _on_fishball_body_entered(body: Node3D) -> void:
	if body is vergil1:
		get_tree().change_scene_to_file("res://boule2.tscn")
