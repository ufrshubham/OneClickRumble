extends Sprite



func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		GlobalData.burst_fire = true
		queue_free()
