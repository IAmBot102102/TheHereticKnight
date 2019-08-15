extends KinematicBody2D
#Player Object Class
const SPEED = 200
#Speed of movement
var movedir = Vector2(0,0)
#MoveDirection is the vector2dthingsomeoneelsedothispls
onready var PlayerStats = {
	"Health" : 100,
	"Arrows" : 10
}
#Player stats
func _physics_process(delta):
	controls_loop()
	movement_loop()
	
func controls_loop():
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
#Loop input for controlls
func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Vector2(0,0))
	#move_and_slide didnt work because i was adding the speed to the normalized movedirection