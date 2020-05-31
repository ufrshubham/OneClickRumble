extends KinematicBody2D

var speed = 0
var velocity = Vector2.ZERO

func _process(_delta):
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	
	if speed != 0.0:
		velocity = (get_position() - get_global_mouse_position()).normalized()
		
	velocity = move_and_slide(velocity * speed)
	if speed > 0:
		speed -= 50
	elif speed < 0:
		speed += 50

func thrust():
	print(get_position() - get_global_mouse_position())
	speed = 500
	
