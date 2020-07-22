class_name PlayerCondition

var _player

func _init(player):
	_player = player

func evaluate() -> bool:
	return false

func get_next_state_type() -> PlayerStateType:
	return null
