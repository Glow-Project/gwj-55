extends Node2D

var explosion_scene = preload("res://explosion.tscn")

func _on_basket_item_collected(body:Node2D):
	var explosion:Explosion = explosion_scene.instantiate()
	explosion.global_position = body.global_position
	add_child(explosion)
	explosion.emitting = true
	body.queue_free()
	
	$Counter.add_score(1)
