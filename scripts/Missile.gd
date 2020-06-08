extends KinematicBody2D

var velocity = Vector2(800, 0)

func _ready():
	velocity = velocity.rotated(get_rotation())
	
func _process(delta):
# warning-ignore:return_value_discarded
	move_and_collide(velocity * delta)

func _on_Scanner_body_entered(body):
	if GlobalData.has_homing_missile:
		if body.is_in_group("Enemies"):
			self.velocity = (body.get_position() - get_position()).normalized() * 500
			look_at(body.get_position())
