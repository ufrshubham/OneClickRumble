extends Sprite

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		body.get_node("PauseEnemiesTimer").start()
		GlobalData.pause_enemies = true
		queue_free()
