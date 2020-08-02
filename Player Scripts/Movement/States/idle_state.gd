extends "../on_ground.gd"

func enter():
	owner.play_anim("idle")
	
func handle_input(event):
	
	.handle_input(event)
	
func update(delta):
	
	velocity.y += gravity
	velocity = owner.move_and_slide(velocity, Vector2.UP)
	
	if get_input_direction(false):
		emit_signal("finished", "walk")
		
	if not on_ground():
		emit_signal("finished", "fall")
		 
	
