extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_file("res://scenes/school_run.tscn")
