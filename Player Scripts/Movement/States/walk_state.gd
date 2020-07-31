extends "../on_ground.gd"

var MAX_WALK_SPEED = 10*Globals.UNIT_SIZE
var ACCELERATION = 2*Globals.UNIT_SIZE

func initialize(prev_velocity):
	
	enter_velocity = prev_velocity
	
func exit():
	velocity = Vector2()

func enter():

	owner.play_anim("walk")
	
	velocity.x = enter_velocity.x
	
func handle_input(event):
	return .handle_input(event)

func update(_delta):
	
	if not get_input_direction(false):
		emit_signal("finished", "idle")
	
	var direction = get_input_direction(true)
	velocity.x = min(abs(velocity.x) + ACCELERATION, MAX_WALK_SPEED) * direction
	velocity.y += gravity
	
	velocity.x = lerp(velocity.x, 0, 0.2)
	velocity = owner.move_and_slide(velocity, Vector2.UP)
	
	if velocity.y > 0:
		emit_signal("finished", "fall")
