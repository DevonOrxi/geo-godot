class_name InputManager

static func get_x_input_strength() -> float:
	return Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

static func has_just_pressed_up() -> bool:
	return Input.is_action_just_pressed("ui_up")
