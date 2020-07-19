extends KinematicBody2D

enum State {
	FLOOR,
	JUMPING,
	WARPING
}

const _gravity_abs = 512
const _jump_force_abs = 128
const _run_speed = 80

var _state = State.FLOOR
var _velocity = Vector2()
var _up_vector = Vector2(0, -1)
var _str_input_h = 0
var _did_input_v = false

onready var _animatedSprite = $AnimatedSprite

func _ready():
	_animatedSprite.play("idle")

func _physics_process(delta):
	_update_player_input()	
	_apply_gravity(delta)
	_set_x_speed()
	
	match _state:
		State.FLOOR:
			_state_idle()
		State.JUMPING:
			_state_jumping()
		State.WARPING:
			_state_warping()
	
	move_and_slide(_velocity, _up_vector)

func _state_idle():	
	if _did_input_v:
		_start_state_jumping()
	else:
		if _velocity.x != 0:
			_animatedSprite.play("run")
			_animatedSprite.flip_h = _velocity.x < 0
		else:
			_animatedSprite.play("idle")

func _state_jumping():
	if is_on_floor():
		_state = State.FLOOR
		_animatedSprite.play("idle")

func _state_warping():
	pass

func _start_state_jumping():
	_state = State.JUMPING
	_velocity.y = _jump_force_abs * _up_vector.y
	_animatedSprite.play("jump")

func _set_x_speed():
	_velocity.x = _str_input_h * _run_speed

func _apply_gravity(delta):
	var new_vel_y = _velocity.y + _gravity_abs * delta * (-_up_vector.y)
	_velocity.y = clamp(new_vel_y, - _jump_force_abs, _jump_force_abs)

# TODO: Pasar a otra clase
func _update_player_input():
	_str_input_h = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	_did_input_v = Input.is_action_just_pressed("ui_up")
