extends Node2D

var missile = preload("res://scenes/Missile.tscn")
var emeny = preload("res://scenes/Emeny.tscn")

func _input(event):
	if event.is_action_pressed("Fire"):
		var new_missile = missile.instance()
		new_missile.transform = Transform2D(get_node("Player").get_global_rotation(), get_node("Player").get_position())
		add_child(new_missile)
		
		get_node("Player").thrust()


func _on_Timer_timeout():
	var new_enemy = emeny.instance()
	var x = randi() % 640
	var y = randi() % 360
	var rot = randi() % 360
	new_enemy.set_position(Vector2(x, y))
	new_enemy.set_rotation(deg2rad(rot))
	add_child(new_enemy)
	
