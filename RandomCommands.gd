extends Node2D

func _input(event):
	
	if event.is_action_pressed("freeze_time"):
		
		print_debug(get_node("ParallaxBackground/ParallaxLayer/Sprite").position.y)
