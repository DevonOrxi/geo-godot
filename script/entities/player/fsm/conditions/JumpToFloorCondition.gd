extends PlayerCondition

class_name JumpToFloorCondition

func _init(player).(player):
	pass

func evaluate() -> bool:
	return _player.is_on_floor()

func get_next_state_type() -> PlayerStateType:
	return PlayerStateType.FLOOR
