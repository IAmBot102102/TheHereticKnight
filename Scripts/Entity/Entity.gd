extends KinematicBody2D
class_name Entity

# The programmer can edit these in the inspector. Easy to change.
export var Health := 100
export var Speed := 200

# Emitted when move_and_collide returns a body
signal collided (body)
# Emitted when Health is lower than 0
signal killed

func _ready():
	set_process(true)
	set_process_input(true)
	set_physics_process(true)
	
	connect("killed", self, "_on_kill")

# Checks for low health every frame
func _process(delta):
	if Health < 0:
		emit_signal("killed")

func _physics_process(delta):
	# Moves the body along while detecting colliding bodies.
	var body := move_and_collide(movement(delta))
	if body != null: 
		# If a body exists, emit the signal and react.
		emit_signal("collided", body)

func _on_kill():
	self.queue_free()

# Overriden in children scripts to return a movement vector.
func movement(delta) -> Vector2:
	return Vector2.ZERO
