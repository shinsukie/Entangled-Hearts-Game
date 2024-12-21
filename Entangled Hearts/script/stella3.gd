extends CharacterBody3D

const speed = 30
var current_state = IDLE

var dir = Vector3.RIGHT
var start_pos
var in_dialogue : bool = false
var is_roaming = true
var is_chatting = false

var player
var player_in_area = false

enum {
	IDLE,
	NEW_DIR,
	MOVE
}

func _ready():
	var layout = Dialogic.start("boulevard3")
	layout.register_character(load("res://character/stella1.dch"), $".")
func _process(delta):
	
	if current_state == 0 or current_state == 1:
		$AnimatedSprite3D.play("idle")
	elif current_state == 2 and !is_chatting:
		pass

	if is_roaming:
		match current_state:
			IDLE:
				pass
			MOVE:
				move(delta)
				

func run_rando_dialogue():
	is_chatting = true
	is_roaming = false
	

func ended_dialogue():
	is_chatting = false
	is_roaming = true

func move(delta):
	if !is_chatting:
		position += dir * speed * delta
