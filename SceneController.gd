extends Node2D

func _input(event):
	
	if event.is_action_pressed("freeze_time"):
		
		self.paused = true
		yield(get_tree().create_timer(2.0),"timeout")
		self.paused = false
		
		
