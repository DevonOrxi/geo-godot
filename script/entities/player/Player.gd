extends KinematicBody2D

class_name Player

enum Facing {
	LEFT,
	RIGHT
}

const _gravity_abs = 512
const _jump_force_abs = 140
const _run_speed = 80

var velocity = Vector2()
var up_vector = Vector2(0, -1)

export var warped = false
export(Facing) var facing = Facing.RIGHT

onready var animatedSprite = $AnimatedSprite
onready var fsm = $FSM

func _ready():
	_set_warp_collisions()
	fsm.start()

func input_x_speed():
	velocity.x = InputManager.get_x_input_strength() * _run_speed

func input_jump():
	velocity.y = _jump_force_abs * up_vector.y

func apply_gravity(delta):
	var new_vel_y = velocity.y + _gravity_abs * delta * (-up_vector.y)
	velocity.y = clamp(new_vel_y, - _jump_force_abs, _jump_force_abs)

func update_all_movement(delta):
	apply_gravity(delta)
	velocity = move_and_slide(velocity, up_vector)

func _set_warp_collisions():
	set_collision_mask_bit(1, warped)
	set_collision_mask_bit(2, not warped)

func _pause_collisions():
	set_collision_mask_bit(1, false)
	set_collision_mask_bit(2, false)

# TODO: Signals maybe?
func on_start_warping():
	_pause_collisions()

func on_end_warping():
	_set_warp_collisions()
