extends PlayerCondition

class_name FloorToJumpCondition

func _init(player: Player).(player):
	pass

func evaluate() -> bool:
	if not _player.warped:
		return _player.is_on_floor()
	else:
		return _player.is_on_ceiling()

func get_next_state_type():
	return PlayerStateType.JUMPING
