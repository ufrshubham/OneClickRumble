extends AnimatedSprite

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		if GlobalData.player_lives < 5:
			GlobalData.increase_player_life()
			get_tree().get_current_scene().get_node("PickupPlayer").play()
			queue_free()
