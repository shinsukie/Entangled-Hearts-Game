extends Node2D

# Camera shake parameters
var _intensity = 1.0  # Maximum shake intensity
var _duration = 1.0  # Duration of the shake in seconds
var _start_time = 0
var _current_time = 0.0  # Time tracker for smooth oscillations

func _ready() -> void:
	randomize()
	$Transition.play("FadeIn")
	$VergilCry/Sprite2D/VergilCrying.play("VergilCryWakeup")
	shake_camera(5.0, 10.0)  # Start shaking immediately

func _process(delta: float) -> void:
	if _start_time > 0:  # Only process if a shake is active
		var elapsed_time = Time.get_ticks_msec() - _start_time
		_current_time += delta  # Increment smooth time tracking
		
		var remaining_time = (_duration - float(elapsed_time) / 1000.0) / _duration
		
		if remaining_time > 0:
			# Apply easing to reduce intensity over time
			var smooth_intensity = _intensity * remaining_time
			
			# Generate smooth offsets using sine waves
			var rand_x = sin(_current_time * 10.0) * smooth_intensity
			var rand_y = cos(_current_time * 10.0) * smooth_intensity
			
			# Update the camera offset
			$Camera2D.offset = Vector2(rand_x, rand_y)
		else:
			# Reset when shaking ends
			$Camera2D.offset = Vector2.ZERO
			_start_time = 0

# Start the camera shake
func shake_camera(intensity: float = 1.0, duration: float = 1.0) -> void:
	_intensity = intensity
	_duration = duration  # Shake duration in seconds
	_start_time = Time.get_ticks_msec()
	_current_time = 0.0  # Reset the smooth time tracker


func _on_vergil_crying_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://scenes/3_bedroom.tscn")
