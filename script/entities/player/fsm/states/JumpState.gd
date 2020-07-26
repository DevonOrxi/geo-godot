extends PlayerState

class_name JumpState

func _init(player).(player):
	_conditions.append(JumpToFloorCondition.new(player))
	_type = PlayerStateType.JUMPING

func enter():
	.enter()
	_set_animation()

func update(delta):
	.update(delta)
	
	_player.input_x_speed()
	
	_set_animation()
	
	_player.update_all_movement(delta)

func _set_animation():
	if _player.velocity.y * _player.up_vector.y >= 0:
		_player.animatedSprite.play("jump")
	else:
		_player.animatedSprite.play("fall")
	
	if _player.velocity.x != 0:
		_player.animatedSprite.flip_h = _player.velocity.x < 0
