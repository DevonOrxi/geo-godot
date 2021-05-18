extends Node2D

class_name Gameplay

func _ready():
	var level = LevelManager.instance_current_level()
	
	add_child(level)
