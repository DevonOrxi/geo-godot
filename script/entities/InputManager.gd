class_name InputManager

static func get_x_input_strength() -> float:
	return Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

static func _has_just_pressed_up() -> bool:
	return Input.is_action_just_pressed("ui_up")

static func _has_just_pressed_down() -> bool:
	return Input.is_action_just_pressed("ui_down")

static func has_just_pressed_jump(is_warped: bool) -> bool:
	return _has_just_pressed_up() if not is_warped else _has_just_pressed_down()
	
static func has_just_pressed_warp(is_warped: bool) -> bool:
	return _has_just_pressed_up() if is_warped else _has_just_pressed_down()
