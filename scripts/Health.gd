extends AnimatedSprite

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		if GlobalData.player_lives < 5:
			GlobalData.increase_player_life()
			queue_free()
