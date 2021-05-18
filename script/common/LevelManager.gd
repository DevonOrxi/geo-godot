extends Node2D

var _current_level_index = 0
var _all_levels: Array = [
	"res://scene/level/Demo.tscn"
]

func instance_current_level() -> Level:
	var normalizedIndex = _current_level_index % _all_levels.size()
	var levelPath = _all_levels[normalizedIndex]
	var level = ResourceLoader.load(levelPath).instance()
	
	return level
