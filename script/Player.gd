extends KinematicBody2D

enum State {
	IDLE,
	JUMPING,
	WARPING
}

var _state = State.IDLE
var _gravity = 512
var _velocity = Vector2()
var _up_vector = Vector2(0, -1)

func _ready():
	$AnimatedSprite.play("idle")

func _physics_process(delta):
	
	match _state:
		State.IDLE:
			_state_idle()
		State.JUMPING:
			_state_jumping()
		State.WARPING:
			_state_warping()
	
	move_and_slide(_velocity, _up_vector)
	
	pass

func _state_idle():	
	if Input.is_action_just_pressed("ui_up"):
		_state = State.JUMPING
		$AnimatedSprite.play("jump")

func _state_jumping():
	if is_on_floor():
		_state = State.IDLE
		$AnimatedSprite.play("idle")

func _state_warping():
	pass
