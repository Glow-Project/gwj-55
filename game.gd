extends Node2D

func _on_basket_item_collected(body:Node2D):
	body.hide()
	
	$Counter.add_score(1)
