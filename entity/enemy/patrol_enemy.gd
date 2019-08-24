extends Enemy

# The (float) seconds until the timer restarts.
export var MovementInterval := 0.8
"""
Must be at least 4. The higher it is, the higher it is,
the higher the chance he won't move.
"""
export var ChanceVelocityZero := 7
# This is set when the timer times out.
var move := Vector2.ZERO

func _ready():
	assert(ChanceVelocityZero > 4)
	
	var timer := Timer.new()
	timer.start(MovementInterval)
	timer.connect("timeout", self, "_on_timeout")
	add_child(timer)

# Overriden function from `class_name Entity`
func movement(delta) -> Vector2:
	return move.normalized() * Speed * delta

func _on_timeout():
	# randomize() is always called before doing new RNG.
	randomize()
	# Chooses a random number between 0-ChanceVelocityZero (rand > 4)
	var rand := randi() % ChanceVelocityZero
	print(rand)
	
	match rand:
		0: move = Vector2.UP
		1: move = Vector2.DOWN
		2: move = Vector2.LEFT
		3: move = Vector2.RIGHT
		_: move = Vector2.ZERO
