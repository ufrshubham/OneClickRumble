extends KinematicBody2D

var speed : int = 0
var velocity : Vector2 = Vector2.ZERO
var shield_power = preload("res://scenes/ShieldPower.tscn")

func _process(_delta):
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)	
	if speed != 0.0:
		velocity = (get_position() - get_global_mouse_position()).normalized()
		velocity = -1 * velocity
		
	velocity = move_and_slide(velocity * speed)
	_apply_friction()

func _apply_friction():
	if speed > 0:
		speed -= 25
	elif speed < 0:
		speed += 25

func push(power:int):
	speed = power

func activate_shield():
	var shield = shield_power.instance()
	call_deferred("add_child", shield)

func _on_Area2D_body_entered(body):
	if body.is_in_group("EnemyProjectiles"):
		GlobalData.reduce_player_life()
		body.queue_free()


func _on_SpeedBoostTimer_timeout():
	GlobalData.player_speed = 250


func _on_PauseEnemiesTimer_timeout():
	GlobalData.pause_enemies = false
