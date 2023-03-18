extends Node2D
class_name GameOver

var win_sound = preload("res://win_musicbox.mp3")
var loose_sound = preload("res://loose_sound.mp3")
var alternate_win_sound = preload("res://alarm_clock_eriklindmanmata.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Emoji.play(Globals.animation)
	$Description.text = Globals.description % abs(Globals.score)

	if Globals.animation == "asleep":
		$Sound.stream = win_sound
	elif Globals.animation == "fully_awake":
		$Sound.stream = loose_sound
	else:
		$Sound.stream = alternate_win_sound
	$Sound.play()

func _on_reset_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
