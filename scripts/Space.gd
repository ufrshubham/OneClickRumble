extends Node2D

var missile = preload("res://scenes/NormalMissile.tscn")
var health_up = preload("res://scenes/Health.tscn")
onready var window_dim = get_viewport_rect().size

func _ready():
	# This will ensure that player gets placed at the center of screen.
	get_node("Player").set_position(window_dim/2)
	
	get_node("Boundaries/Top").set_position(Vector2.ZERO)
	get_node("Boundaries/Left").set_position(Vector2.ZERO)
	get_node("Boundaries/Bottom").set_position(Vector2(0, window_dim.y))
	get_node("Boundaries/Right").set_position(Vector2(window_dim.x, 0))
	get_node("Boundaries/StaticBody2D/Right").set_position(Vector2(window_dim.x + 52, 0))

func _process(_delta):
	if Input.is_action_just_pressed("Fire"):
		_fire()
	elif Input.is_action_pressed("Fire"):
		get_node("Player").push(GlobalData.player_speed)
	
	if GlobalData.player_lives <= 0:
		GlobalData.reset()
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()

	if GlobalData.player_score > 500:
		GlobalData.player_level = 2
	elif GlobalData.player_score > 100:
		GlobalData.player_level = 1
	if  GlobalData.player_score > 150:
		GlobalData.allow_health_up = true

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

func _on_PowerTimer_timeout():
	if GlobalData.allow_health_up:
		if  is_instance_valid(GlobalData.current_power):
			GlobalData.current_power.queue_free()
			
		var index = randi() % (GlobalData.power_ups.size())
		
		# This will avoid health power-up if health is already full
		# and burst fire power-up if player already has burst fire. 
		while index == 0 and GlobalData.player_lives == 5:
			index = randi() % (GlobalData.power_ups.size())
		while index == 4 and GlobalData.burst_fire == true:
			index = randi() % (GlobalData.power_ups.size())
			
		GlobalData.current_power = GlobalData.power_ups[index].instance()
		var random_pos = Vector2.ZERO
		random_pos.x = randi() % int(window_dim.x)
		random_pos.y = randi() % int(window_dim.y)
		GlobalData.current_power.set_position(random_pos)
		add_child(GlobalData.current_power)

func _fire():
	var new_missile = _generate_missile()
	new_missile.set_z_index(-1)
	add_child(new_missile)
	get_node("FirePlayer").play()
	if GlobalData.burst_fire:
		for i in range(2):
			var additional_missile = _generate_missile()
			if i < 1:
				additional_missile.set_rotation_degrees(additional_missile.get_rotation_degrees() + 15)
			else:
				additional_missile.set_rotation_degrees(additional_missile.get_rotation_degrees() - 15)
			additional_missile.set_z_index(-1)
			add_child(additional_missile)
	elif GlobalData.front_n_back_fire:
		var additional_missile = _generate_missile()
		additional_missile.set_rotation_degrees(additional_missile.get_rotation_degrees() - 180)
		additional_missile.set_z_index(-1)
		add_child(additional_missile)
