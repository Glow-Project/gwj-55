extends GPUParticles2D

class_name Explosion

@export var size = 1.0

func _ready() -> void:
	process_material.scale_min = 1 + size
	process_material.scale_max = 1 + size
