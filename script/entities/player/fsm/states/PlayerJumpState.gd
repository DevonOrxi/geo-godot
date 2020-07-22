extends PlayerState

class_name PlayerJumpState

func _init(player).(player):
	_conditions.append(JumpToFloorCondition.new(player))
