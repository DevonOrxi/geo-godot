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
	
	if InputManager.has_just_pressed_up():
		_player.input_jump()
	
	_player.update_all_movement(delta)

func _set_animation():
	if _player.velocity.x != 0:
		_player.animatedSprite.play("run")
		_player.animatedSprite.flip_h = _player.velocity.x < 0
	else:
		_player.animatedSprite.play("idle")
