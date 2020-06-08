extends Sprite

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		body.get_node("HomingMissileTimer").start()
		GlobalData.has_homing_missile = true
		get_tree().get_current_scene().get_node("PickupPlayer").play()
		queue_free()
