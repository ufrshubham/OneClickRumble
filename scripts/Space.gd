extends Node2D

var missile = preload("res://scenes/Missile.tscn")
onready var window_dim = get_viewport_rect().size

func _ready():
	# This will ensure that player gets placed at the center of screen.
	get_node("Player").set_position(window_dim/2)
	GlobalData.player_pos = get_node("Player").get_position()

func _input(event):
	if event.is_action_pressed("Fire"):
		var missile = _generate_missile()
		add_child(missile)		
		get_node("Player").push(500)

func _process(_delta):
	GlobalData.player_pos = get_node("Player").get_position()
	if GlobalData.player_lives <= 0:
		pass
		#print('Player is dead')
	#if GlobalData.player_score > 80:
		#GlobalData.player_level = 2
	if GlobalData.player_score > 100:
		GlobalData.player_level = 1

func _generate_missile():
	var new_missile = missile.instance()
	new_missile.transform = Transform2D(get_node("Player").get_global_rotation(), get_node("Player").get_position())
	new_missile.add_to_group("Projectiles")
	return new_missile

func _on_Timer_timeout():
	var enemy = _generate_enemy_at_random_location()
	add_child(enemy)
	
func _generate_enemy_at_random_location():
	var enemy_level = randi() % (GlobalData.player_level + 1)
	#var enemy_level = rand_range(0, GlobalData.player_level)
	var new_enemy = GlobalData.enemy_types[enemy_level].instance()
	var position = Vector2.ZERO
	position.x = randi() % int(window_dim.x)
	position.y = randi() % int(window_dim.y)
	
	# Makes sure that enemy does not spawn too close to player.
	while position.distance_to(get_node("Player").get_position()) < 80:
		position.x = randi() % int(window_dim.x)
		position.y = randi() % int(window_dim.y)
		
	var rot = randi() % 360
	new_enemy.set_position(position)
	new_enemy.set_rotation(deg2rad(rot))
	
	# This is needed to detect enemies going out of boundaries
	new_enemy.add_to_group("Enemies")
	return new_enemy

func _on_Boundaries_body_entered(body):
	if body.is_in_group("Enemies"):
		body.queue_free()
	elif body.is_in_group("Projectiles"):
		body.queue_free()
	elif body.is_in_group("Player"):
		body.push(-800)
