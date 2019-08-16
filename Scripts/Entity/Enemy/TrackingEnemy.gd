extends Enemy

"""
Trackers should focus on their target and their
target only, so the target is set when spawned.
"""

# Time to wait to retarget when no one's around.
export var IdleRetargetTime := 5

var target : Entity
var timer := Timer.new()
var move := Vector2.ZERO

func _ready():
	add_child(timer)
	
	_retarget()

# Overriden function from `class_name Entity`
func movement(delta) -> Vector2:
	move = target.get_position()
	return move.normalized() * Speed * delta

func _retarget():
	if target != null:
		target.disconnect("killed", self, "_on_target_killed")
	
	# Gets all the possible objects that can be tracked.
	var trackables := get_tree().get_nodes_in_group("trackable")
	var size := trackables.size()
	
	# Waits to retarget instead of resource-hogging
#	if size == 0:
#		timer.start(IdleRetargetTime)
#		# Resumes execution when timer stops.
#		yield(timer, "timeout")
#		timer.stop()
	
	# Called to generate a new seed for randi()
	randomize()
	var rand := randi() % size
	
	target = trackables[rand]
	target.connect("killed", self, "_on_target_killed")

func _on_target_killed():
	print("Killed target successfully")
	self.queue_free()
