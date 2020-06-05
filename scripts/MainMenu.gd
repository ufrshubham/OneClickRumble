extends Node2D

func _on_PlayButton_button_up():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Space.tscn")

func _on_ExitButton_button_up():
	get_tree().quit()
