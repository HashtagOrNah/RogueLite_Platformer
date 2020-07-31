extends "base_state.gd"

var gravity = .8 * Globals.UNIT_SIZE
var enter_velocity = Vector2()
var velocity = Vector2()

func handle_input(event):
	
	return .handle_input(event)
	
func on_ground():
	if owner.is_on_floor():
		return true
	return false

func get_input_direction(flip):
	var input_direction = Vector2()
	input_direction = int(Input.is_action_pressed("walk_right")) - int(Input.is_action_pressed("walk_left"))
	if input_direction and flip:
		update_input_direction(input_direction)
	return input_direction

func update_input_direction(direction):
	var sprite = owner.get_node("Sprite")
	if direction == 1:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
