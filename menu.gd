extends Control

func _process(delta):
	if Input.is_action_just_pressed("key_exit"):
		get_tree().quit()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")

func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://settings.tscn")
