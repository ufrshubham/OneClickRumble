extends "res://scripts/Emeny.gd"

var missile = preload("res://scenes/EnemyMissile.tscn")

func _ready():
	level = 2
	velocity = Vector2(80, 0)
	velocity = velocity.rotated(get_rotation())

func _custom_process():
	pass

func _on_Scanner_body_entered(body):
	if body.is_in_group("Player"):
		_fire()

func _fire():
	var new_missile = missile.instance()
	new_missile.transform = Transform2D(get_global_rotation(), get_position())
	new_missile.velocity = Vector2(800, 0)
	new_missile.add_to_group("Projectiles")
	get_tree().get_current_scene().add_child(new_missile)
