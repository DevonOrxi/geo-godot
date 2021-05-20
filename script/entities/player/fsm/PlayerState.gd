class_name PlayerState

const PlayerStateType = preload("res://script/entities/player/fsm/PlayerStateType.gd").StateType

var _conditions: Array = []
var _player: Player
var _type

func _init(player):
	_player = player

func enter():
#	print("Entered state " + PlayerStateType.keys()[_type])
	pass

func update(_delta):
	pass

func exit():
#	print("Exited state " + PlayerStateType.keys()[_type])
	pass

func get_type():
	return _type

func find_possible_next_state() -> PlayerState:
	var i = 0
	
	while i < _conditions.size():
		var condition = _conditions[i] as PlayerCondition
		
		if condition != null and condition.evaluate():
			return condition.get_next_state_type()
		
		i += 1
	
	return null
