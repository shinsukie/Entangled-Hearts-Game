extends CharacterBody3D

var cardinal_direction : Vector3 = Vector3.DOWN
var direction : Vector3 = Vector3.ZERO
var move_speed : float = 15.0
var state : String = "idle"
var in_dialogue : bool = false
var facing : int = 0  # New variable for facing direction

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite3D = $Sprite3D

func _ready():
	var layout = Dialogic.start("1boulevard")
	layout.register_character(load("res://character/vergil1.dch"), $".")
	UpdateAnimation()
	pass


func _process(delta):
	direction.x = Input.get_action_strength("left") - Input.get_action_strength("right")
	direction.z = Input.get_action_strength("up") - Input.get_action_strength("down")

	velocity = direction * move_speed

	if SetState() or SetDirection():
		UpdateAnimation()

	# Set Facing
	if direction.z > 0:
		facing = 3 # Down
	elif direction.x > 0:
		facing = 2  # Right
	elif direction.z < 0:
		facing = 0 # Up
	elif direction.x < 0:
		facing = 2  # Left

func _physics_process(delta):
	move_and_slide()

func SetDirection() -> bool:
	var new_dir: Vector3 = cardinal_direction
	
	if direction == Vector3.ZERO:
		return false

	if abs(direction.x) > abs(direction.z):
		new_dir = Vector3.LEFT if direction.x < 0 else Vector3.RIGHT
	else:
		new_dir = Vector3.UP if direction.z < 0 else Vector3.DOWN

	if new_dir == cardinal_direction:
		return false

	cardinal_direction = new_dir
	sprite.scale.x = -1 if cardinal_direction == Vector3.LEFT else 1 if cardinal_direction == Vector3.RIGHT else sprite.scale.x
	return true

func SetState() -> bool:
	var new_state: String = "idle" if direction == Vector3.ZERO else "walk"

	if new_state == state:
		return false

	state = new_state
	return true

func UpdateAnimation() -> void:
	var animation_column = 0 if state == "idle" else 1
	# Update frame based on facing direction and state
	sprite.frame = animation_column + (facing * 3)

func Player():
	pass
