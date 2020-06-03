extends HBoxContainer

func _process(_delta):
	for i in GlobalData.player_lives_delete_list:
		var health_node = get_node("Sprite%d" % i)
		if health_node:
			health_node.queue_free()
	GlobalData.player_lives_delete_list = []
