extends "../base_state.gd"

var velocity = Vector2()
var gravity = 30
var speed = 75

func enter():
	
	owner.get_node("AnimatedSprite").play("flying")
	owner.get_node("Particles2D").emitting = true
	
func update(_delta):
	
	if velocity.x < 0:
		owner.get_node("AnimatedSprite").flip_h = true
	else:
		owner.get_node("AnimatedSprite").flip_h = false
	
	velocity = owner.move_and_slide(velocity, Vector2.UP)
	
	velocity.y = gravity
	
	if owner.is_on_floor():
		velocity = Vector2()
		emit_signal("finished", "idle")

func fly_away(coll_dir):
	
	if coll_dir.y == 0:
		velocity = speed * (-coll_dir+Vector2.UP)
	elif coll_dir.y >= 0:
		pass
	
