extends Area2D

signal item_collected(body:Node2D)

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _input(event) -> void:
	if event is InputEventMouseMotion:
		global_position.x = event.position.x

func _on_body_entered(body) -> void:
	emit_signal("item_collected", body)
