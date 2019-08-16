extends Entity

export var MovementInterval := 0.8

var move := Vector2.ZERO

func _ready():
	add_to_group("enemy")
	
	var timer := Timer.new()
	timer.start(MovementInterval)
	timer.connect("timeout", self, "_on_timeout")
	add_child(timer)
	
func movement(delta) -> Vector2:
	return move.normalized() * Speed * delta

func _on_timeout():
	randomize()
	var rand := randi() % 4
	
	match rand:
		1: move = Vector2.UP
		2: move = Vector2.DOWN
		3: move = Vector2.LEFT
		4: move = Vector2.RIGHT
		_: move = Vector2.ZERO