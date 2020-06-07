extends Node

var player_lives:int = 5
var player_score:int = 0
var player_lives_delete_list:Array = []
var player_lives_add_list:Array=[]
var player_level:int = 0
var player_speed:int = 250
var pause_enemies:bool = false
var allow_health_up:bool = false
var current_power = null
var burst_fire:bool = false
var front_n_back_fire: bool = false
var enemy_types:Array = [
	preload("res://scenes/EnemyLevel1.tscn"),
	preload("res://scenes/EnemyLevel2.tscn"),
	preload("res://scenes/EnemyLevel3.tscn")
]
var power_ups:Array = [
	preload("res://scenes/Health.tscn"), #0
	preload("res://scenes/Shield.tscn"), #1
	preload("res://scenes/SpeedBoost.tscn"), #2
	preload("res://scenes/PauseEnemies.tscn"), #3
	preload("res://scenes/BurstFire.tscn"), #4
	preload("res://scenes/FrontnBackFire.tscn") #5
]

func reduce_player_life():
	if self.player_lives > 0:
		self.player_lives_delete_list.append(self.player_lives)
		self.player_lives -= 1

func increase_player_life():
	self.player_lives += 1
	self.player_lives_add_list.append(self.player_lives)

func reset():
	player_lives = 5
	player_score = 0
	player_lives_delete_list = []
	player_lives_add_list =[]
	player_level = 0
	player_speed = 250
	pause_enemies = false
	allow_health_up = false
	burst_fire = false
	current_power = null
	front_n_back_fire = false
