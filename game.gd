extends Node2D

var explosion_scene = preload("res://explosion.tscn")

var explosions = [
	preload("res://explosion_1.mp3"),
	preload("res://explosion_2.mp3")
]

func _on_basket_item_collected(body:Node2D):
	body.queue_free()
	
	$Counter.add_score(1)


func _on_spawner_sheep_reached_abyss(body):
	var explosion:Explosion = explosion_scene.instantiate()
	explosion.global_position = body.global_position
	add_child(explosion)
	
	var fx = AudioStreamPlayer.new()
	fx.stream = explosions[randi_range(0,len(explosions)-1)]
	add_child(fx)
	fx.play()

	
	explosion.emitting = true

	body.queue_free()
