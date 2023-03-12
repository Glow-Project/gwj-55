extends GPUParticles2D

class_name Explosion

@export var size = 1.0

func _ready() -> void:
	process_material.scale_min *= 2*size
	process_material.scale_max *= 2*size
