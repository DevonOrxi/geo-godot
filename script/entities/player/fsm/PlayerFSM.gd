class_name PlayerFSM

var _player
var _current_state
var _states: Array = [
	PlayerFloorState.new(_player),
	PlayerJumpState.new(_player)
]

const PlayerStateType = preload("res://script/entities/player/fsm/PlayerStateType.gd")

func _init(player):
	_player = player
	_change_state_to(_states[0])

func _fsm_step(delta):
	if _current_state != null:
		_current_state.update(delta)
		_evaluate_and_try_state_change()
	else:
		print("Invalid current state for Player in fsm_step")

func _evaluate_and_try_state_change():
	var next_state_type = _current_state.find_possible_next_state()
	
	if next_state_type != null and next_state_type is PlayerStateType:
		var next_state = _get_state_with_type(next_state_type)
		_change_state_to(next_state)

func _change_state_to(next_state):
	if next_state != null:
		if _current_state != null:
			_current_state.exit()
		
		_current_state = next_state
		next_state.enter()
	else:
		print("Invalid next state for Player in change_state")

func _get_state_with_type(type: PlayerStateType):
	for state in _states:
		if state.type == type:
			return state
	return
