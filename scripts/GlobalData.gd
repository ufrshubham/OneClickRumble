extends Node

var player_lives = 5
var player_score = 0
var player_lives_delete_list:Array = []
var player_lives_add_list:Array=[]
var player_level = 0
var allow_health_up:bool = false
var current_power
var enemy_types:Array = [
	preload("res://scenes/EnemyLevel1.tscn"),
	preload("res://scenes/EnemyLevel2.tscn")
]
var power_ups:Array = [
	preload("res://scenes/Health.tscn")
]

func reduce_player_life():
	self.player_lives_delete_list.append(self.player_lives)
	self.player_lives -= 1

func increase_player_life():
	self.player_lives += 1
	self.player_lives_add_list.append(self.player_lives)
