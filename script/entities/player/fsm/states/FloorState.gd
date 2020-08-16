extends PlayerState

class_name FloorState

func _init(player).(player):
	_conditions.append(FloorToJumpCondition.new(player))
	_conditions.append(FloorToWarpingCondition.new(player))
	_type = PlayerStateType.FLOOR

func enter():
	.enter()
	_set_animation()

func update(delta):
	.update(delta)
	
	_player.input_x_speed()
	_set_animation()
	
	_check_jump()
	_check_warp()
	
	_player.update_all_movement(delta)

func _check_jump():
	if InputManager.has_just_pressed_jump(_player.warped):
		_player.execute_jump()

func _check_warp():
	if InputManager.has_just_pressed_warp(_player.warped):
		_player.execute_warp()

func _set_animation():
	if _player.velocity.x != 0:
		_player.animatedSprite.play("run")
		_player.animatedSprite.flip_h = _player.velocity.x < 0
	else:
		_player.animatedSprite.play("idle")
