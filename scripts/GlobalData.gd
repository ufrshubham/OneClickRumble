extends Node

var player_lives : int = 5
var player_score : int = 0
var player_level : int = 0
var player_speed : int = 250

var player_lives_delete_list : Array = []
var player_lives_add_list : Array= []

var burst_fire : bool = false
var pause_enemies : bool = false
var allow_power_up : bool = false
var front_n_back_fire : bool = false
var has_homing_missile : bool = false

var current_power = null

# Preloaded enemy scenes.
var enemy_types:Array = [
	preload("res://scenes/EnemyLevel1.tscn"), # slow and dumb
	preload("res://scenes/EnemyLevel2.tscn"), # can fire
	preload("res://scenes/EnemyLevel3.tscn")  # can fire and follow
]

# Preloaded power-up scenes.
var power_ups:Array = [
	preload("res://scenes/Health.tscn"), #0
	preload("res://scenes/PauseEnemies.tscn"), #1
	
	preload("res://scenes/Shield.tscn"), #2
	preload("res://scenes/FrontnBackFire.tscn"), #3
	
	preload("res://scenes/SpeedBoost.tscn"), #4
	preload("res://scenes/BurstFire.tscn"), #5
	
	preload("res://scenes/HomingMissilePowerUp.tscn"), #6
	
	preload("res://scenes/SpeedBoost.tscn"), #7
	preload("res://scenes/BurstFire.tscn"), #8
	preload("res://scenes/HomingMissilePowerUp.tscn") #9
]

# Defines which powers will be available for spawning
# depending on player's level.
var _level_to_power_map = {
	0 : 2,
	1 : 4,
	2 : 10
}

func reduce_player_life():
	if self.player_lives > 0:
		self.player_lives_delete_list.append(self.player_lives)
		self.player_lives -= 1

func increase_player_life():
	self.player_lives += 1
	self.player_lives_add_list.append(self.player_lives)

# Resets everything back to initial state.
# Should be called before reloading the current scene.
func reset():
	self.player_lives = 5
	self.player_score = 0
	self.player_level = 0
	self.player_speed = 250
	self.player_lives_add_list.clear()
	self.player_lives_delete_list.clear()
	self.burst_fire = false
	self.pause_enemies = false
	self.allow_power_up = false
	self.front_n_back_fire = false
	self.current_power = null
	self.has_homing_missile = false

# Returns the max allowed level from _level_to_power_map.
func get_max_allowed_power():
	return self._level_to_power_map[self.player_level]
