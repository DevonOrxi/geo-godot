class_name PlayerCondition

var _next_state
var _player

func _init(player):
	_player = player

func evaluate() -> bool:
	return false

func get_next_state():
	return _next_state

#	static func grounded(player: Player):
#		return player.is_on_floor() if player.warped else player.is_on_ceiling()
#
#	static func airborne(player: Player):
#		return !grounded(player)
