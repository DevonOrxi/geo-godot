extends Node
class_name PlayerFSM

@onready var _player = super.get_parent()
var _current_state

var _states: Array = []

const PlayerStateType = preload("res://script/entities/player/fsm/PlayerStateType.gd").StateType

func start():
	_init_states_array()
	_change_state_to(_states[0])

func _init_states_array():
	_states.append(FloorState.new(_player))
	_states.append(JumpState.new(_player))
	_states.append(WarpingState.new(_player))

func _physics_process(delta):
	if _current_state != null:
		_current_state.update(delta)
		_evaluate_and_try_state_change()
	else:
		print("Invalid current state for Player in fsm_step")

func _evaluate_and_try_state_change():
	var next_state_type = _current_state.find_possible_next_state()
	
	if next_state_type == null:
		return
	
	if not (next_state_type >= 0 or next_state_type < PlayerStateType.size()):
		return
	
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

func _get_state_with_type(type):
	for state in _states:
		if state.get_type() == type:
			return state
	return
