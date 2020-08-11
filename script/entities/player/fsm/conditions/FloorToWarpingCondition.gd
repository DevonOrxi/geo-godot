extends PlayerCondition

class_name FloorToWarpingCondition

func _init(player: Player).(player):
	pass

func evaluate() -> bool:
	
#	TODO: Raycast "down"
	if not _player.warped:
		return _player.is_on_floor() and InputManager.has_just_pressed_down()
	else:
		return _player.is_on_ceiling() and InputManager.has_just_pressed_up()

func get_next_state_type():
	return PlayerStateType.JUMPING
