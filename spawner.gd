extends Node2D

var sheep_scene = preload("res://sheep.tscn")

@export var abyss_y:int
@export var left_point:Marker2D
@export var right_point:Marker2D

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var sheep:Sheep = sheep_scene.instantiate()
	sheep.random()
	sheep.abyss_y = abyss_y
	add_child(sheep)
	sheep.global_position.x = randf_range(
		left_point.global_position.x, 
		right_point.global_position.x
		)
	sheep.global_position.y = left_point.position.y
	
