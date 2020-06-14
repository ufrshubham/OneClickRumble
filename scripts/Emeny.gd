extends KinematicBody2D

var enemy_worth = 10
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
	if GlobalData.pause_enemies == false:
		# warning-ignore:return_value_discarded
		move_and_collide(enemy_velocity * delta)
		_custom_process(delta)

func _on_Area2D_body_entered(body):
	if body.is_in_group('Player'):
		_handle_player_collision(body)
	elif body.is_in_group("Projectiles"):
		_on_projectile_collision(body)
		_explode()
		body.queue_free()
	get_tree().get_current_scene().get_node("ExplosionPlayer").play()

func _handle_player_collision(player):
	GlobalData.reduce_player_life()
	player.push(-800)
	queue_free()

func _explode():
	get_node("CollisionShape2D").call_deferred("set_disabled", true)
	get_node("Area2D/CollisionShape2D").call_deferred("set_disabled", true)
	get_node("Sprite").set_visible(false)
	
	get_node("AnimatedSprite").set_visible(true)
	get_node("AnimatedSprite").playing = true
	get_node("AnimatedSprite").play("default")

func _on_AnimatedSprite_animation_finished():
	queue_free()
