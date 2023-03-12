extends Node2D

signal sheep_reached_abyss(body:Node2D)

var sheep_scene = preload("res://sheep.tscn")

@export var abyss_point:Marker2D
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
	sheep.connect("abyss_reached", _on_abyss_reached)
	sheep.random()
	sheep.abyss_point = abyss_point
	add_child(sheep)
	sheep.global_position.x = randf_range(
		left_point.global_position.x, 
		right_point.global_position.x
		)
	sheep.global_position.y = left_point.position.y
	
func _on_abyss_reached(body:Node2D):
	print_debug("lol")
	emit_signal("sheep_reached_abyss", body)
