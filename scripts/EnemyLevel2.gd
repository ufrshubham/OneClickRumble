extends "res://scripts/Emeny.gd"

var missile = preload("res://scenes/Missile.tscn")

func _ready():
	level = 2
	velocity = Vector2(150, 0)
	velocity = velocity.rotated(get_rotation())

func _custom_process():
	var my_dir = velocity.normalized()
	var player_dir = my_dir.direction_to(GlobalData.player_pos)

	if my_dir.dot(player_dir) < 0.1:
		print("A sees P!")
