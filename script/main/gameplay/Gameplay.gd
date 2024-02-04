extends Node2D

class_name Gameplay

@onready var levelManager = $LevelManager
var _current_level: Level

func _ready():
	_load_level()

func _load_level():
	_current_level = levelManager.get_level()
	
	_current_level.connect("ready", Callable(self, "_on_level_ready"))
	
	add_child(_current_level)

func _on_level_ready():
	_current_level.goal.connect("goal_reached", Callable(self, "_on_goal_reached"))

func _on_goal_reached():
	levelManager.on_current_level_clear()
	
	remove_child(_current_level)
	
	_load_level()
