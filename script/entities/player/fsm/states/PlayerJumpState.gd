extends PlayerState

class_name PlayerJumpState

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
	_player.animatedSprite.play("jump")
