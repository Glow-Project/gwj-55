extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Animation.play("intro")

func _on_animation_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://menu.tscn")
