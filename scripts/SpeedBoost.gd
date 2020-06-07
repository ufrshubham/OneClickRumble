extends Sprite

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		body.get_node("SpeedBoostTimer").start()
		GlobalData.player_speed = 400
		queue_free()
