extends RigidBody2D
class_name Sheep

signal abyss_reached(body:Node2D)

@export var abyss_point:Marker2D
@export_range(0.5,5) var speed = 1.0
@export_range(0.2,1) var size = 1.0

var signal_emitted = false

func _ready():
	scale = Vector2(size,size)
	$Sheep.scale = Vector2(size,size)
	$CollisionPolygon2D.scale = Vector2(size,size)
	gravity_scale = speed

func _process(delta)->void:
	if global_position.y > abyss_point.position.y and !signal_emitted:
		signal_emitted = true
		emit_signal("abyss_reached", self)

func random()->void:
	speed = randf_range(0.5,5)
	size = randf_range(0.2,1)
