extends Entity

"""
The main player script contains Input, Movement and
various other things for the user to control.
"""
var DirectionFaced = "RIGHT"
var movedir := Vector2()
var collisionWithEnemy = false
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
		if LEFT == true:
			DirectionFaced = "LEFT"
		if RIGHT == true:
			DirectionFaced = "RIGHT"
		if UP == true:
			DirectionFaced = "UP"
		if DOWN == true:
			DirectionFaced = "DOWN"
		

func movement(delta) -> Vector2:
	if collisionWithEnemy == false:
		return movedir.normalized() * Speed * delta
	else:
		collisionWithEnemy = false
		return movedir.normalized() * Speed * delta * -10