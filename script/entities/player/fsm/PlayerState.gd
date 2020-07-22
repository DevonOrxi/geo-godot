class_name PlayerState

var _conditions: Array = []
var _player
var _type

const PlayerStateType = preload("res://script/entities/player/fsm/PlayerStateType.gd").PlayerStateType

func _init(player):
	_player = player

func enter():
	print("Entered state " + PlayerStateType.keys()[_type])

func update(delta):
	pass

func exit():
	print("Exited state " + PlayerStateType.keys()[_type])

func find_possible_next_state() -> PlayerState:
	var i = 0
	
	while i < _conditions.size():
		var condition = _conditions[i] as PlayerCondition
		if _is_condition_valid(condition) and condition.evaluate():
			return condition.get_next_state()
	
	return null

func _is_condition_valid(condition) -> bool:
	return condition.has_method("evaluate") and condition.has_method("get_next_state")
