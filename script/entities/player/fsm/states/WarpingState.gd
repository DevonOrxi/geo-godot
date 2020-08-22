extends PlayerState

class_name WarpingState

const UP_Y = -1
const DOWN_Y = 1

var _tween: Tween = Tween.new()
var _next_up_dir: float

# TODO: Mover esto
var _warp_time = 0.25

func _init(player).(player):
	_conditions.append(WarpingToFloorCondition.new(player))
	_type = PlayerStateType.WARPING

func enter():
	.enter()
	
	_next_up_dir = UP_Y if _player.warped else DOWN_Y
	_player.add_child(_tween)
	
	_set_animation()
	_start_warping()

func update(delta):
	.update(delta)

func _set_animation():
	_player.animatedSprite.play("idle")

func _start_warping():
	var p_scale = _player.get_scale()
	
	_tween.interpolate_property(_player, "scale", p_scale, Vector2(p_scale.x, - _next_up_dir), _warp_time)
	_tween.interpolate_callback(self, _warp_time / 2, "_mid_warping")
	
	_tween.start()
	
	_player.on_start_warping()

func _mid_warping():
	_player.on_mid_warping()
	
	_tween.interpolate_callback(self, _warp_time / 2, "_end_warping")
	_tween.start()

func _end_warping():
	_player.remove_child(_tween)
	_player.on_end_warping()
