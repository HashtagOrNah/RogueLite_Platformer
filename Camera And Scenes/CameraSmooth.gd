extends Camera2D

onready var tween = get_node("Tween")

var transitioning = false

func move_camera(next_pos):

	if not transitioning:
		get_tree().paused = true
		tween.interpolate_property(self, "position", self.position, next_pos, 0.5,
			Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		tween.start()

		transitioning = true

		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().paused = false
		transitioning = false
