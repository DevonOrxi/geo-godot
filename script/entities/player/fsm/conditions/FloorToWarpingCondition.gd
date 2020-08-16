extends PlayerCondition

class_name FloorToWarpingCondition

func _init(player: Player).(player):
	pass

func evaluate() -> bool:
#	TODO: Raycast "down"
	return _player.is_on_floor() and _player.is_warping

func get_next_state_type():
	return PlayerStateType.WARPING
