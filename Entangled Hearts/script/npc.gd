extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

func _process(delta):
	$AnimatedSprite3D.play("idle")
