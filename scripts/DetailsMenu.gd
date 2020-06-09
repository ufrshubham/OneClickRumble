extends Node2D

onready var window_dim = get_viewport_rect().size

func _ready():
	var pos = window_dim/2
	pos.y -= 200
	get_node("Enemies").set_position(pos)
	pos.y += 250
	get_node("Power-Ups").set_position(pos)
	pos.y += 250
	get_node("ButtonsCenter").set_position(pos)

func _on_Back_button_up():
	get_tree().change_scene("res://scenes/MainMenu.tscn")
