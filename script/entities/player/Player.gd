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
var is_warping = false
var has_both_feet_floored = false

export var warped = false
export(Facing) var facing = Facing.RIGHT

onready var animatedSprite = $AnimatedSprite
onready var fsm = $FSM
onready var left_foot_raycast = $LeftFootRaycast
onready var right_foot_raycast = $RightFootRaycast

func _ready():
	_set_warp_collisions()
	_set_raycast_masks()
	_set_color()
	fsm.start()

func _physics_process(delta):
	has_both_feet_floored = left_foot_raycast.is_colliding() and right_foot_raycast.is_colliding()

func input_x_speed():
	velocity.x = InputManager.get_x_input_strength() * _run_speed

func execute_jump():
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
	left_foot_raycast.collision_mask = 0
	right_foot_raycast.collision_mask = 0

func _set_color():
	var palette = ColorManager.get_current_palette()
	animatedSprite.modulate = palette.top_color if not warped else palette.bottom_color

func _set_raycast_masks():
	left_foot_raycast.collision_mask = 4 if not warped else 2
	right_foot_raycast.collision_mask = left_foot_raycast.collision_mask

# TODO: Signals maybe?
func on_start_warping():
	_pause_collisions()

func on_mid_warping():
	var next_up_dir = -1 if warped else 1
	
	warped = not warped
	up_vector = Vector2(0, next_up_dir)
	
	_set_color()

func on_end_warping():
	is_warping = false
	_set_warp_collisions()
	_set_raycast_masks()
