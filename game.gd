extends Node2D

var explosion_scene = preload("res://explosion.tscn")

var explosions = [
	preload("res://explosion_1.mp3"),
	preload("res://explosion_2.mp3")
]

var rewards = [
	preload("res://chord1.mp3"),
	preload("res://chord2.mp3"),
	preload("res://chord3.mp3"),
	preload("res://chord4.mp3"),
	preload("res://chord5.mp3"),
	preload("res://chord6.mp3"),
]

var punishments = [
	preload("res://bad_chord1.mp3"),
	preload("res://bad_chord2.mp3"),
	preload("res://bad_chord3.mp3"),
	preload("res://bad_chord4.mp3"),
]

func _on_basket_item_collected(body:Node2D):
	body.queue_free()
	$Tacho.inc()
	
	if $Tacho.score > 0 && $Tacho.score % 5 == 0:
		var fx = AudioStreamPlayer.new()
		fx.stream = rewards[randi_range(0,len(rewards)-1)]
		fx.set_bus("RewardFX")
		add_child(fx)
		fx.play()
	
	if $Tacho.score == $Tacho.total:
		get_tree().change_scene_to_file("res://game_over.tscn")
	

func _on_spawner_sheep_reached_abyss(body):
	$Tacho.dec()
	var explosion:Explosion = explosion_scene.instantiate()
	explosion.global_position = body.global_position
	add_child(explosion)
	
	var fx = AudioStreamPlayer.new()
	fx.stream = explosions[randi_range(0,len(explosions)-1)]
	fx.set_bus("ExplosionFX")
	add_child(fx)
	fx.play()
	explosion.emitting = true

	body.queue_free()
	
	if $Tacho.score < 0 && $Tacho.score % 5 == 0:
		var fx2 = AudioStreamPlayer.new()
		fx2.stream = punishments[randi_range(0,len(punishments)-1)]
		fx2.set_bus("RewardFX")
		add_child(fx2)
		fx2.play()
	
	if $Tacho.score == -$Tacho.total:
		get_tree().change_scene_to_file("res://game_over.tscn")
