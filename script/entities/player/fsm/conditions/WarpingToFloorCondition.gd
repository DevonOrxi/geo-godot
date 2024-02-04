extends PlayerCondition

class_name WarpingToFloorCondition

func _init(player: Player):
	super(player)
	pass

func evaluate() -> bool:
	return not _player.is_warping

func get_next_state_type():
	return PlayerStateType.FLOOR
