extends Area2D

class_name Goal

signal goal_reached
@export var warped = false

@onready var animatedSprite = $AnimatedSprite2D

func _ready():
	_set_color()
	_play_animation()

func _set_color():
	var palette = ColorManager.get_current_palette()
	animatedSprite.modulate = palette.top_color if not warped else palette.bottom_color

func _play_animation():
	animatedSprite.play("idle")

func _on_player_body_entered(_body: Player):
	emit_signal("goal_reached")
