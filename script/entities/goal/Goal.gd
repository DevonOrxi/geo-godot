extends KinematicBody2D

class_name Goal

export var warped = false

onready var animatedSprite = $AnimatedSprite

func _ready():
	_set_color()
	_play_animation()

func _set_color():
	var palette = ColorManager.get_current_palette()
	animatedSprite.modulate = palette.top_color if not warped else palette.bottom_color

func _play_animation():
	animatedSprite.play("idle")
