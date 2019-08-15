extends Entity
var MoveTimerLength := 20
var MoveTimer = 0
var move = Vector2(0,0)
func _ready():
	add_to_group("enemy")
	var movedir = dir.randomDirection()
	
	
func _physics_process(delta):
	## TRYING TO MAKE THE ENEMY MOVE
	## IDK HOW BUT THIS IS NOT MOVING IM GOIN INSANE HERE ndvklsa;vndksla;vds
	var motion = move.normalized() * Speed
	move_and_slide(motion, Vector2(0,0))
	if MoveTimer > 0:
		MoveTimer -= 1
	if MoveTimer == 0:
		var movedir = dir.randomDirection()
		MoveTimer = MoveTimerLength