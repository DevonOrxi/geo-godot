class_name PlayerFSM

var _player
var _current_state
var _states: Array = []

func _init(player):
	_player = player
	add_state(PlayerFloorState.new(_player))

func add_state(state):
	var i = 0
	
	while i < _states.size():
		var i_state = _states[i]
		
		if i_state != null and i_state.type == state.type:
			return
	
	_states.append(state)

func update():
	var next_state = _current_state.find_possible_next_state()
	
	if next_state != null:
		_current_state.exit()
		_current_state = next_state
		next_state.enter()
	
	_current_state.update()
