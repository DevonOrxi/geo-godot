extends PlayerState

class_name WarpingState

var callback_tween = Tween.new()
var scale_tween = Tween.new()
var next_y_dir: float

# TODO: Mover esto
var _warp_time = 0.25

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
	
	scale_tween.interpolate_property(_player, "scale", p_scale, Vector2(p_scale.x, next_y_dir), _warp_time)
	callback_tween.interpolate_callback(self, _warp_time / 2, "_mid_warping")
	
	scale_tween.start()
	callback_tween.start()
	
	_player.on_start_warping()
	
	
func _mid_warping():
#	Change color
	_player.warped = not _player.warped
	_player.up_vector = Vector2(0, next_y_dir)
	
	callback_tween.interpolate_callback(self, _warp_time / 2, "_end_warping")
	callback_tween.start()

func _end_warping():
	_player.on_end_warping()
