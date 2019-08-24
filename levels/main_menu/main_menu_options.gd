extends VBoxContainer

onready var Back = $BackToMenu

func _ready():
	Back.connect("pressed", self, "_on_back_press")

func _on_back_press():
	var main_menu := load("res://levels/main_menu/main_menu_buttons.tscn")
	var main_scene = main_menu.instance()
	
	get_parent().add_child(main_scene)
	get_parent().move_child(main_scene, 1)
	
	self.queue_free()
