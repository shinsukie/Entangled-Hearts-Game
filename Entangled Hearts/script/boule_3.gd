extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Transition.play("FadeIn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	



func _on_area_3d_body_entered(body: Node3D) -> void:
	get_tree().change_scene_to_file("res://Tests/Credits.tscn")
