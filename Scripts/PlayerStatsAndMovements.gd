extends KinematicBody2D
const SPEED = 200
var movedir = Vector2(0,0)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var PlayerStats = {
	"Health" : 100,
	"Arrows" : 10
}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	controls_loop()
	movement_loop()
	
	

func controls_loop():
	var LEFT	 = Input.is_action_pressed("ui_left")
	var RIGHT	 = Input.is_action_pressed("ui_right")
	var UP	 = Input.is_action_pressed("ui_up")
	var DOWN	 = Input.is_action_pressed("ui_down")

	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)

func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Vector2(0,0))