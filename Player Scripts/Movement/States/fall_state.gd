extends "../in_air.gd"

var prev_state_walk = false

func initialize(prev_velocity, walking):
	
	owner.play_anim("fall")
	enter_velocity = prev_velocity
	if walking:
		prev_state_walk = true
	
func exit():
	
	velocity = Vector2()
	enter_velocity = Vector2()
	sprite.rotation_degrees = 0
	prev_state_walk = false

func enter():
	
	var input_direction = get_input_direction(false)
	if prev_state_walk:
		sprite.rotation_degrees = 90*input_direction
	if input_direction:
		velocity = enter_velocity
	
	else:	
		velocity.y = gravity

func update(delta):
	
	var direction = get_input_direction(false)
	velocity = move(direction, velocity)
	
	if sprite.rotation_degrees > 0:
		sprite.rotation = lerp_angle(sprite.rotation, (PI-.1) , .1)
	elif sprite.rotation_degrees < 0:
		sprite.rotation = lerp_angle(sprite.rotation, -(PI-.1) , .1)
	else:
		sprite.rotation = 180
	velocity.y += gravity
	
	if on_ground():
		if velocity.x != 0:
			emit_signal("finished", "walk")
		emit_signal("finished", "idle")

