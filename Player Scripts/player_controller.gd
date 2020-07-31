extends KinematicBody2D

var player_effects = load("res://Player Scripts/PlayerEffects.tscn")

func play_anim(animation):
	
	var player_animations = get_node("Sprite")
	
	if animation == "jump":
		var instanced_scene = player_effects.instance()
		add_child(instanced_scene)
		instanced_scene.set_as_toplevel(true)
		instanced_scene.global_position = self.global_position
		player_animations.play(animation)
	
	elif animation == "fall":
		player_animations.play("jump")
	else:
		player_animations.play(animation)
