extends Sprite


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		GlobalData.burst_fire = false
		GlobalData.front_n_back_fire = true
		get_tree().get_current_scene().get_node("PickupPlayer").play()
		queue_free()
