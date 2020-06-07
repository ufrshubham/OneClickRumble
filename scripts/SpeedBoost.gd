extends Sprite

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		body.get_node("SpeedBoostTimer").start()
		body.show_particles()
		GlobalData.player_speed = 400
		get_tree().get_current_scene().get_node("PickupPlayer").play()
		queue_free()
