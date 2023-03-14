extends Node2D

signal fallen_asleep()
signal woken_up()

@export var total:int = 30
@onready var score:int = 0

var event_emitted:bool = false

func _ready():
	$Emoji.play("half_sleeping")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Needle.global_rotation_degrees = clamp(180/total*score + 90.0, 0, 180)
	
	var animation = "half_sleeping"
	if score >= total/4:
		animation = "asleep"
	elif score <= -total/4:
		animation = "awake"
	
	if $Emoji.animation != animation:
		$Emoji.play(animation)

func inc()->void:
	$Counter.add_score(1)
	score = min(score+1, total)
	if score == total and !event_emitted:
		emit_signal("fallen_asleep")
		event_emitted = true

func dec()->void:
	$Counter.add_score(-1)
	score = max(score-1, -total)
	if score == total and !event_emitted:
		emit_signal("woken_up")
		event_emitted = true
