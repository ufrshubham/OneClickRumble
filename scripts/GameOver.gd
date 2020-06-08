extends Node2D

onready var window_dim = get_viewport_rect().size

func _ready():
	get_node("ButtonsCenter").set_position(window_dim/2)
	print(GlobalData.player_score)
	get_node("ButtonsCenter/VBoxContainer/Score").set_text("Your Score : " + str(GlobalData.player_score))

func _on_RetryButton_button_up():
	GlobalData.reset()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Space.tscn")

func _on_ExitButton_button_up():
	get_tree().quit()
