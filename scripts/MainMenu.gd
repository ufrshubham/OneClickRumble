extends Node2D

onready var window_dim = get_viewport_rect().size

func _ready():
	var pos = window_dim/2
	pos.y += 100
	get_node("ButtonsCenter").set_position(pos)
	pos.y -= 300
	get_node("GameTitle").set_position(pos)

func _on_PlayButton_button_up():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Space.tscn")

func _on_ExitButton_button_up():
	get_tree().quit()

func _on_Details_button_up():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/DetailsMenu.tscn")

func _on_Credits_button_up():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Credits.tscn")
