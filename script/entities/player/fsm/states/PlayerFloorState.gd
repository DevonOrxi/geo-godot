extends PlayerState

class_name PlayerFloorState

func _init(player).(player):
	_conditions.append(FloorToJumpCondition.new(player))
