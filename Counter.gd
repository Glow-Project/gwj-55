extends Label

@onready var score = 0

func _ready():
	update()

func update() -> void:
	text = str(score)
	if score < 0:
		add_theme_color_override("font_color", "red")
	else:
		add_theme_color_override("font_color", "white")

func add_score(points:int) -> void :
	score += points
	update()
