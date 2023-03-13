extends Node2D

signal fallen_asleep()
signal woken_up()

@export var total:float = 10
@onready var score:float = 0

var event_emitted:bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Needle.global_rotation_degrees = clamp(180/total*score + 90.0, 0, 180)

func inc()->void:
	score = min(score+1, total)
	if score == total and !event_emitted:
		emit_signal("fallen_asleep")
		event_emitted = true

func dec()->void:
	score = max(score-1, -total)
	if score == total and !event_emitted:
		emit_signal("woken_up")
		event_emitted = true
