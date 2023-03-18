extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Animation.play("intro")

func _process(delta):
	if Input.is_action_just_pressed("key_exit"):
		get_tree().change_scene_to_file("res://menu.tscn")

func _on_animation_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://menu.tscn")
