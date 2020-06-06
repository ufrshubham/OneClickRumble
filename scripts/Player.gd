extends KinematicBody2D

var speed : int = 0
var velocity : Vector2 = Vector2.ZERO

func _process(_delta):
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)	
	if speed != 0.0:
		velocity = (get_position() - get_global_mouse_position()).normalized()
		
	velocity = move_and_slide(velocity * speed)
	_apply_friction()

func _apply_friction():
	if speed > 0:
		speed -= 25
	elif speed < 0:
		speed += 25

func push(power:int):
	speed = power

func _on_Area2D_body_entered(body):
	if body.is_in_group("EnemyProjectiles"):
		GlobalData.reduce_player_life()
		body.queue_free()
