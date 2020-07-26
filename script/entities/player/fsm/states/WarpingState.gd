extends PlayerState

class_name WarpingState

var tween = Tween.new()
var next_y_dir: float

func _init(player).(player):
#	_conditions.append(JumpToFloorCondition.new(player))
	_type = PlayerStateType.WARPING

func enter():
	.enter()
	
	next_y_dir = 1 if _player.warped else -1
	
	_set_animation()
	_start_warping()

func update(delta):
	.update(delta)

func _set_animation():
	_player.animatedSprite.play("idle")

func _start_warping():
	var p_scale = _player.get_scale()
	
	tween.interpolate_property(_player, "scale", p_scale, Vector2(p_scale.x, next_y_dir), 0.25)
	tween.interpolate_callback(self, 0.25, "_mid_warping")
	
	_player.on_start_warping()
	
	
func _mid_warping():
#	Change color
	_player.warped = not _player.warped
	
	_player.up_vector = Vector2(0, next_y_dir)
	pass

func _end_warping():
	_player.on_end_warping()
