extends "../base_state.gd"

var velocity = Vector2()
var gravity = 100


func enter():
	
	owner.get_node("AnimatedSprite").play("idle")
	
func update(delta):
	
	velocity.y += gravity
	
	owner.move_and_slide(velocity, Vector2.UP)
