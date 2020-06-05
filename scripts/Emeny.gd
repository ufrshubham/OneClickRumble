extends KinematicBody2D

var level = 1
var velocity = Vector2(50, 0)

func _ready():
	velocity = velocity.rotated(get_rotation())
	
func _process(delta):
	# warning-ignore:return_value_discarded
	move_and_collide(velocity * delta)
	_custom_process()

func _custom_process():
	pass

func _on_Area2D_body_entered(body):
	if body.is_in_group('Player'):
		_handle_player_collision(body)
	elif body.is_in_group("Projectiles"):
		_handle_projectile_collision(body)

func _handle_player_collision(player):
	GlobalData.player_lives_delete_list.append(GlobalData.player_lives)
	GlobalData.player_lives -= 1
	player.push(-800)
	queue_free()

func _handle_projectile_collision(projectile):
	if level == 1:
		GlobalData.player_score += 10
	elif level == 2:
		GlobalData.player_score += 20
	projectile.queue_free()
	queue_free()	
