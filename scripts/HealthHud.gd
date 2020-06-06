extends HBoxContainer

func _process(_delta):
	for i in GlobalData.player_lives_delete_list:
		var health_node = get_node("Sprite%d" % i)
		if health_node:
			health_node.set_visible(false)
	for i in GlobalData.player_lives_add_list:
		var health_node = get_node("Sprite%d" % i)
		if health_node:
			health_node.set_visible(true)
	GlobalData.player_lives_delete_list.clear()
	GlobalData.player_lives_add_list.clear()
