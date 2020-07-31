extends "state_machine.gd"

func _ready():
	states_map = {
		"idle": $Idle,
		"walk": $Walk,
		"jump": $Jump,
		"fall": $Fall
	}

func _change_state(state_name):

	if not _active:
		return
	if state_name == "jump" and current_state == $Walk:
		$Jump.initialize($Walk.velocity, null)
	elif state_name == "jump" and current_state == $Jump:
		$Jump.initialize($Jump.velocity, "jump")
	elif state_name == "fall" and current_state == $Walk:
		$Fall.initialize($Walk.velocity, true)
	elif state_name == "fall" and current_state == $Jump:
		$Fall.initialize($Jump.velocity, false)
	elif state_name == "walk" and current_state == $Fall:
		$Walk.initialize($Fall.velocity)
	._change_state(state_name)

func _input(event):
	
	current_state.handle_input(event)
