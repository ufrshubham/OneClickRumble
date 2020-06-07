extends AnimatedSprite

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		body.activate_shield()
		get_tree().get_current_scene().get_node("PickupPlayer").play()
		queue_free()
