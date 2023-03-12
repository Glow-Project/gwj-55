extends Label

@onready var score = 0

func _ready():
	update()

func update() -> void:
	text = str(score).pad_zeros(4)

func add_score(points:int) -> void :
	score += points
	update()
