extends HBoxContainer

func _ready():
	get_node("Label").set_text('Score : 0')

func _process(_delta):
	get_node("Label").set_text('Score : %d' % GlobalData.player_score)
