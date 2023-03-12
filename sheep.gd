extends RigidBody2D

@export_range(0.5,10,0.1) var speed = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	mass *= speed

func add_speed(speed:float): 
	mass *= speed
