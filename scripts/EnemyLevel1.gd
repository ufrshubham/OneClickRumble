extends "res://scripts/Emeny.gd"

func _on_enemy_ready():
	enemy_worth = 10
	self.enemy_velocity = Vector2(50, 0)

func _on_projectile_collision(_projectile):
	GlobalData.player_score += enemy_worth
