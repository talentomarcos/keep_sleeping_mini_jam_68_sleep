extends TextureButton

export(String, FILE, "*.tscn") var path_to_scene_to_be_loaded

func _on_button_up():
	var new_scene = load(path_to_scene_to_be_loaded)
	get_tree().change_scene_to(new_scene)
