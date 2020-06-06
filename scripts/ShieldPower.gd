extends Area2D

func _on_ShieldPower_body_entered(body):
	if body.is_in_group("EnemyProjectiles"):
		body.queue_free()
	elif body.is_in_group("Enemies"):
		GlobalData.player_score += body.enemy_worth
		body.queue_free()

func _on_Timer_timeout():
	queue_free()
