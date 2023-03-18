extends Area2D

signal item_collected(body:Node2D)

func _input(event) -> void:
	if event is InputEventMouseMotion:
		global_position.x = event.position.x

func _on_body_entered(body) -> void:
	emit_signal("item_collected", body)
