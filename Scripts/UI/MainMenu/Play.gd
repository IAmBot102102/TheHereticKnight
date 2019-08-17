extends Button

func _ready():
	connect("pressed", self, "_on_press")

func _on_press():
	# Gets the setting for this scene. It's located under
	# Project > Project Settings > Game
	var path_to_scene :String = \
		ProjectSettings.get("game/main_menu/onplay_open_scene")
	
	get_tree().change_scene(path_to_scene)
