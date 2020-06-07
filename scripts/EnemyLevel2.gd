extends "res://scripts/Emeny.gd"

var missile = preload("res://scenes/EnemyMissile.tscn")

func _on_enemy_ready():
	enemy_worth = 20
	self.enemy_velocity = Vector2(120, 0)

func _on_Scanner_body_entered(body):
	if body.is_in_group("Player"):
		_fire()

func _fire():
	var new_missile = missile.instance()
	new_missile.transform = Transform2D(get_global_rotation(), get_position())
	new_missile.velocity = Vector2(800, 0)
	new_missile.add_to_group("EnemyProjectiles")
	new_missile.set_z_index(-1)
	
	# Apparently you cannot add new Area nodes while on_entered() is being processed
	# for another Area node. Not yet sure what call_deferred() exactly does,
	# but looking at the method description and the problem, it seems that 
	# it basically triggers the given method with given parameters after 
	# the on_entered() signal completes.
	get_tree().get_current_scene().call_deferred("add_child", new_missile)
	get_tree().get_current_scene().get_node("FirePlayer").play()

func _on_projectile_collision(_projectile):
	GlobalData.player_score += enemy_worth

func _on_FireTimer_timeout():
	_fire()
