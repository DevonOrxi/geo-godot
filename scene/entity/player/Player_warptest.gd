extends KinematicBody2D

var scale_tween = Tween.new()
var next_y_dir = 1

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_select"):
		var p_scale = get_scale()
		
		scale_tween.interpolate_property(self, "scale", p_scale, Vector2(p_scale.x, next_y_dir), 0.25)
		
		next_y_dir *= -1
