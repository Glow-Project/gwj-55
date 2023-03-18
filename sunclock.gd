extends Node2D

signal sunrise()

@export var duration:int = 30

func _ready():
	var tween = create_tween()
	tween.tween_property($Clock, "global_rotation_degrees", 360, duration)
	tween.tween_property($ClockSound, "volume_db", -25, duration)
	tween.tween_callback(func():emit_signal("sunrise"))
