extends Entity

"""
The main player script contains Input, Movement and
various other things for the user to control.
"""

var movedir := Vector2()

func _ready():
	add_to_group("playable", true)
	add_to_group("trackable", true)
	connect("collided", self, "_on_collision")

func _on_collision(body : KinematicCollision2D):
	if body.collider is Entity:
		if body.collider.is_in_group("enemy"):
			Health -= 20

func _input(event):
	if event is InputEventKey:
		var LEFT = Input.is_action_pressed("ui_left")
		var RIGHT = Input.is_action_pressed("ui_right")
		var UP = Input.is_action_pressed("ui_up")
		var DOWN = Input.is_action_pressed("ui_down")
		movedir.x = -int(LEFT) + int(RIGHT)
		movedir.y = -int(UP) + int(DOWN)

func movement(delta) -> Vector2:
	return movedir.normalized() * Speed * delta
