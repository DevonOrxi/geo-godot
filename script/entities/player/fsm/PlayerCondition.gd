class_name PlayerCondition

var _player: Player

const PlayerStateType = preload("res://script/entities/player/fsm/PlayerStateType.gd").StateType

func _init(player: Player):
	_player = player

func evaluate() -> bool:
	return false

func get_next_state_type():
	return null
