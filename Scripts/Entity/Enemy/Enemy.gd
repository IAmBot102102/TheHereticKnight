extends Entity
class_name Enemy

func _ready():
	set_process_input(false)
	add_to_group("enemy")
