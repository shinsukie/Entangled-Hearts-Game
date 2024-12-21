extends CharacterBody3D

@export var wander_direction : Node3D



func _physics_process(delta: float) -> void:
	$AnimatedSprite3D.play("idle")
	move_and_slide()
