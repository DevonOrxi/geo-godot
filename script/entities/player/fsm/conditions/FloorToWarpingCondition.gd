extends PlayerCondition

class_name FloorToWarpingCondition

func _init(player: Player).(player):
	pass

func evaluate() -> bool:
	return InputManager.has_just_pressed_warp(_player.warped) and _player.has_both_feet_floored and _player.is_on_floor()

func get_next_state_type():
	return PlayerStateType.WARPING
