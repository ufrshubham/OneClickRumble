extends KinematicBody2D

var velocity = Vector2(250, 0)

func _ready():
	velocity = velocity.rotated(get_rotation())
	set_scale(Vector2(2,2))
	
func _process(delta):
# warning-ignore:return_value_discarded
	move_and_collide(velocity * delta)
