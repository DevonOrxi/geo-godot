class_name PlayerFSM

var _player
var _current_state
var _states: Array = [
	PlayerFloorState.new(_player),
	PlayerJumpState.new(_player)
]

func _init(player):
	_player = player
	_current_state = _states[0]

func _fsm_step(delta):
	_current_state.update(delta)
	_ask_for_state_change()

func _ask_for_state_change():
	var next_state_type = _current_state.find_possible_next_state()
	
	if next_state_type != null and next_state_type is PlayerStateType:
		var next_state = _get_state_with_type(next_state_type)
		
		if next_state != null:
			_current_state.exit()
			_current_state = next_state
			next_state.enter()

func _get_state_with_type(type: PlayerStateType):
	for state in _states:
		if state.type == type:
			return state
	return
