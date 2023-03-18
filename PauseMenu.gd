extends Control

func _on_menu_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu.tscn")

func _on_continue_button_pressed():
	get_tree().paused = false
	hide()

func _on_reset_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://game.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
