extends KinematicBody2D

var velocity = Vector2(50, 0)

func _ready():
	velocity = velocity.rotated(get_rotation())
	
func _process(delta):
# warning-ignore:return_value_discarded
	move_and_collide(velocity * delta)

func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		print('Failed!!!')
