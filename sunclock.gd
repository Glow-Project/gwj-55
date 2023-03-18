extends Node2D

signal sunrise()

@onready var step:int = 7
@onready var degrees:int = 0

func _on_timer_timeout():
	$Clock.global_rotation_degrees+=step
	
	# use dedicated degree variable, since the global_rotation_degrees variable
	# wraps around
	degrees += step
	if degrees >= 360:
		$Timer.stop()
		emit_signal("sunrise")
	$ClockSound.volume_db += 1
