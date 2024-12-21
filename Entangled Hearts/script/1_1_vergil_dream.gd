extends Node2D

@onready var transition = $Transition
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	transition.play("FadeIn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_file("res://scenes/1Bedroom.tscn")
