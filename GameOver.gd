extends Node2D
class_name GameOver

var descriptions = {
	"asleep": {
		"won": "<whispering>Sleep well, my dear! I'm proud of all of your %d sheeps. Sweet dreams!</whispering>",
		"lost": "Have you ever had a dream, Neo, that you were so sure was real? What if you were unable to wake from that dream? How would you know the difference between the dream world and the real world, with only %d sheeps?"
	},
	"fully_awake": {
		"won": "YOU. ARE. ALIVE! Sleep is for the weak! You avoided to count %d sheeps.",
		"lost": "FATALITY! You're sleepwalking like a zombie...mentaly wasted. You only got %d sheeps."
	},
}

var win_sound = preload("res://win_musicbox.mp3")
var loose_sound = preload("res://loose_sound.mp3")
var alternate_win_sound = preload("res://alarm_clock_eriklindmanmata.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	print_debug(Globals.animation)
	$Emoji.play(Globals.animation)
	$Description.text = Globals.description % abs(Globals.score)

	if Globals.animation == "asleep":
		$Sound.stream = win_sound
	elif Globals.animation == "fully_awake":
		$Sound.stream = loose_sound
	else:
		$Sound.stream = alternate_win_sound

	$Sound.play()
