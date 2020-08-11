extends Node2D

func _ready():
	
	
	get_node("player_effects").play("jump_effect")
	
func _physics_process(delta):
	
	if get_node("player_effects").get_frame() == 2:
		self.queue_free()
