extends KinematicBody2D

var velocity = Vector2(800, 0)

func _ready():
	velocity = velocity.rotated(get_rotation())
	
func _process(delta):
# warning-ignore:return_value_discarded
	move_and_collide(velocity * delta)
