extends "../base_state_machine.gd"

func _ready():
	states_map = {
		"idle": $Idle,
		"flying": $Flying
	}

func _change_state(state_name):

	if not _active:
		return
	._change_state(state_name)

func _on_FlyingRaycasts_colliding(vector_of_collision):
	if current_state == $Flying:
		current_state.fly_away(vector_of_collision) 
		
	# Don't change state if you are already flying
	else:
		$Flying.fly_away(vector_of_collision)
		_change_state("flying")
