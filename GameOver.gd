extends Node2D


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

# Called when the node enters the scene tree for the first time.
func _ready():
	var end = "asleep"
	if sign(get_parent().Tacho.score) == -1:
		end = "fully_wake"
	$Emoji.play(end)
	
	if abs(get_parent().Tacho.score) >= get_parent().Tacho.total:
		$Description.text = descriptions[end]["won"] % get_parent().Tacho.score
	else:
		$Description.text = descriptions[end]["lost"] % get_parent().Tacho.score
