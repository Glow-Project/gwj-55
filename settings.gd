extends Control

var allow_update = false

func _ready():
	$SettingContainer/MasterSlider.value = AudioServer.get_bus_volume_db(
		AudioServer.get_bus_index("Master")
	) 
	$SettingContainer/MusicSlider.value = AudioServer.get_bus_volume_db(
		AudioServer.get_bus_index("Music")
	)
	$SettingContainer/FXSlider.value = AudioServer.get_bus_volume_db(
		AudioServer.get_bus_index("FX")
	)
	allow_update = true

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

func _on_fx_slider_value_changed(value):
	if !allow_update:
		return
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("FX"), value)
	if !$FXTest.playing:
		$FXTest.play()

func _on_music_slider_value_changed(value):
	if !allow_update:
		return
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)
	if !$MusicTest.playing:
		$MusicTest.play()

func _on_master_slider_value_changed(value):
	if !allow_update:
		return
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	if !$MusicTest.playing:
		$MusicTest.play()

