extends Node2D

class_name LevelManager

var _current_level_index: int = 0
var _all_levels: Array = [
	"res://scene/level/Demo.tscn"
]

func get_level() -> Level:
	var normalizedIndex = _normalize(_current_level_index)
	var levelPath = _all_levels[normalizedIndex]
	var level = ResourceLoader.load(levelPath).instance()
	
	return level

func on_current_level_clear():
	_current_level_index = _normalize(_current_level_index + 1)

func _normalize(level_index: int) -> int:
	return level_index % _all_levels.size()
