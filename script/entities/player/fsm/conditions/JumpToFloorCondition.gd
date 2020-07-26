extends PlayerCondition

class_name JumpToFloorCondition

func _init(player: Player).(player):
	pass

func evaluate() -> bool:
	return _player.is_on_floor()

func get_next_state_type():
	return PlayerStateType.FLOOR
