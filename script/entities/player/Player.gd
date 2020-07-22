extends KinematicBody2D

class_name Player

enum Facing {
	LEFT,
	RIGHT
}

const _gravity_abs = 512
const _jump_force_abs = 128
const _run_speed = 80

var _state: PlayerState
var _velocity = Vector2()
var _up_vector = Vector2(0, -1)
var _fsm: PlayerFSM

export var warped = false
export(Facing) var facing = Facing.RIGHT

onready var _animatedSprite = $AnimatedSprite

func _ready():
	_animatedSprite.play("idle")
	_set_warp_collisions()
	_set_fsm()

func _physics_process(delta):
	_apply_gravity(delta)
	_set_x_speed()
	
#	match _state:
#		State.FLOOR:
#			_state_idle()
#		State.JUMPING:
#			_state_jumping()
#		State.WARPING:
#			_state_warping()
	
	move_and_slide(_velocity, _up_vector)

func _state_idle():	
	if InputManager.has_just_pressed_up():
		_start_state_jumping()
	else:
		if _velocity.x != 0:
			_animatedSprite.play("run")
			_animatedSprite.flip_h = _velocity.x < 0
		else:
			_animatedSprite.play("idle")

func _state_jumping():
	if is_on_floor():
#		_state = State.FLOOR
		_animatedSprite.play("idle")

func _state_warping():
	pass

func _start_state_jumping():
#	_state = State.JUMPING
	_velocity.y = _jump_force_abs * _up_vector.y
	_animatedSprite.play("jump")

func _set_x_speed():
	_velocity.x = InputManager.get_x_input_strength() * _run_speed

func _apply_gravity(delta):
	var new_vel_y = _velocity.y + _gravity_abs * delta * (-_up_vector.y)
	_velocity.y = clamp(new_vel_y, - _jump_force_abs, _jump_force_abs)

func _set_warp_collisions():
	set_collision_mask_bit(1, warped)
	set_collision_mask_bit(2, not warped)

func _set_fsm():
	_fsm = PlayerFSM.new(self)
