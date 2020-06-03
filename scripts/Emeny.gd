extends KinematicBody2D

var velocity = Vector2(50, 0)

func _ready():
	velocity = velocity.rotated(get_rotation())
	
func _process(delta):
# warning-ignore:return_value_discarded
	move_and_collide(velocity * delta)

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
	GlobalData.player_score += 1
	projectile.queue_free()
	queue_free()	
