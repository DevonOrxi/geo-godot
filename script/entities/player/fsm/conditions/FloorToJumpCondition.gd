extends PlayerCondition

class_name FloorToJumpCondition

func _init(player).(player):
	pass

func evaluate() -> bool:
	return not _player.is_on_floor()

func get_next_state_type() -> PlayerStateType:
	return PlayerStateType.JUMPING
