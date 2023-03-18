extends Node2D

signal sunrise()

@export var duration:int = 30

func _ready():
	var tween = create_tween().set_parallel(true)
	
	tween.tween_property($Clock, "rotation_degrees", 180, duration)
	tween.tween_property($ClockSound, "volume_db", -10, duration)
	await tween.finished
	emit_signal("sunrise")
