extends VBoxContainer

onready var Play = $Play
onready var Options = $Options

func _ready():
	Play.connect("pressed", self, "_on_play_press")
	Options.connect("pressed", self, "_on_options_press")

func _on_play_press():
	# Gets the setting for this scene. It's located under
	# Project > Project Settings > Game
	var path_to_scene : String = \
		ProjectSettings.get("game/main_menu/onplay_open_scene")
	
	get_tree().change_scene(path_to_scene)

func _on_options_press():
	var options_menu := load("res://Scenes/UI/MainMenu/MenuOptions.tscn")
	var options_scene : Node = options_menu.instance()
	
	get_parent().add_child(options_scene)
	get_parent().move_child(options_scene, 1)
	
	self.queue_free()
