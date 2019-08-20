extends Entity

"""
The main player script contains Input, Movement and
various other things for the user to control.
"""

# Used for _find_dir()
enum _direction { LEFT, RIGHT, UP, DOWN }

var movedir := Vector2()
var collisionWithEnemy := false

func _ready():	
	add_to_group("playable", true)
	add_to_group("trackable", true)
	connect("collided", self, "_on_collision")

func _on_collision(body : KinematicCollision2D):
	if body.collider is Entity:
		if body.collider.is_in_group("enemy"):
			Health -= 20
			collisionWithEnemy = true

func _input(event):
	if event is InputEventKey:
		var LEFT = Input.is_action_pressed("ui_left")
		var RIGHT = Input.is_action_pressed("ui_right")
		var UP = Input.is_action_pressed("ui_up")
		var DOWN = Input.is_action_pressed("ui_down")
		movedir.x = -int(LEFT) + int(RIGHT)
		movedir.y = -int(UP) + int(DOWN)

func movement(delta) -> Vector2:
	if collisionWithEnemy: 
		movedir *= -5
	return movedir.normalized() * Speed * delta

func _find_dir() -> int:
	"""
	Since the only possible values for "movedir" right now could
	be Vector2 constants, we'll match to those.
	"""
	match movedir:
		Vector2.RIGHT: return _direction.RIGHT
		Vector2.LEFT: return _direction.LEFT
		Vector2.DOWN: return _direction.DOWN
		Vector2.UP: return _direction.UP
	return -1