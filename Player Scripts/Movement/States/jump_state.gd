extends "../in_air.gd"
	
var rotation_dir

	
func initialize(prev_velocity, prev_state):
	
	enter_velocity = prev_velocity

func enter():
	
	owner.play_anim("jump")
	rotation_dir = 0
	velocity.x = enter_velocity.x
	velocity.y = max_jump_velocity


func handle_input(event):
	
	if event.is_action_released("jump"):
		velocity.y = min_jump_velocity
		emit_signal("finished", "fall")

func update(delta):
	
	if not rotation_dir:
		rotation_dir = get_input_direction(false)
		
	var direction = get_input_direction(false)
	velocity = move(direction, velocity)
	
	sprite.rotation = lerp_angle(sprite.rotation, rotation_dir*(PI-.01), .07)
	
	velocity.y += gravity
	
	if velocity.y >= 0:
		emit_signal("finished", "fall")
	
func exit():
	
	velocity = Vector2()
	enter_velocity = Vector2()
	
	
	
