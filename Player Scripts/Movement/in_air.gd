extends "motion.gd"

onready var sprite = owner.get_node("Sprite")

var max_jump_velocity = -20 * Globals.UNIT_SIZE
var min_jump_velocity = -5 * Globals.UNIT_SIZE

var horizontal_velocity = 10*Globals.UNIT_SIZE
var horizontal_acceleration = 2 * Globals.UNIT_SIZE

var jump_duration = 5

func handle_input(event):
	
	.handle_input(event)

func move(direction, current_velocity):
	
	current_velocity.x = min(abs(current_velocity.x) + horizontal_acceleration, horizontal_velocity) * direction
	current_velocity.x = lerp(current_velocity.x, 0, 0.2)
	return owner.move_and_slide(current_velocity, Vector2.UP)
