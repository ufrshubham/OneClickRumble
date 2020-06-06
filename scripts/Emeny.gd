extends KinematicBody2D

var enemy_velocity: Vector2 = Vector2(50, 0)

# Override this method to setup initial state of this enemy.
# Most probably you would want to setup the velocity of enemy in this method.
func _on_enemy_ready():
	pass

# Override this method to perform custom operations per tick. 
func _custom_process(_delta):
	pass

# Override this method to handle collision with projectiles fired by player.
# Do not try to free this enemy or projectile in this method. It will be 
# taken care of in base class.
func _on_projectile_collision(_projectile):
	pass
	
func _ready():
	_on_enemy_ready()
	enemy_velocity = enemy_velocity.rotated(get_rotation())

func _process(delta):
	# warning-ignore:return_value_discarded
	move_and_collide(enemy_velocity * delta)
	_custom_process(delta)

func _on_Area2D_body_entered(body):
	if body.is_in_group('Player'):
		_handle_player_collision(body)
	elif body.is_in_group("Projectiles"):
		_on_projectile_collision(body)
		body.queue_free()
		queue_free()

func _handle_player_collision(player):
	GlobalData.reduce_player_life()
	player.push(-800)
	queue_free()
