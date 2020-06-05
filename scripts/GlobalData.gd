extends Node

var player_lives = 5
var player_score = 0
var player_lives_delete_list = []
var player_level = 0
var player_pos = Vector2.ZERO
var enemy_types = [
	preload("res://scenes/EnemyLevel1.tscn"),
	preload("res://scenes/EnemyLevel2.tscn")
]
