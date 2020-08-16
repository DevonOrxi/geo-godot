extends PlayerState

class_name WarpingState

const UP_Y = -1
const DOWN_Y = 1

var tween: Tween = Tween.new()
var next_up_dir: float

# TODO: Mover esto
var _warp_time = 0.25

func _init(player).(player):
	_conditions.append(WarpingToFloorCondition.new(player))
	_type = PlayerStateType.WARPING

func enter():
	.enter()
	
	next_up_dir = UP_Y if _player.warped else DOWN_Y
	_player.add_child(tween)
	
	_set_animation()
	_start_warping()

func update(delta):
	.update(delta)

func _set_animation():
	_player.animatedSprite.play("idle")

func _start_warping():
	var p_scale = _player.get_scale()
	
	tween.interpolate_property(_player, "scale", p_scale, Vector2(p_scale.x, -next_up_dir), _warp_time)
	tween.interpolate_callback(self, _warp_time / 2, "_mid_warping")
	
	tween.start()
	tween.start()
	
	_player.on_start_warping()

func _mid_warping():
#	Change color
	_player.warped = not _player.warped
	_player.up_vector = Vector2(0, next_up_dir)
	
	tween.interpolate_callback(self, _warp_time / 2, "_end_warping")
	tween.start()

func _end_warping():
	_player.remove_child(tween)
	_player.on_end_warping()
