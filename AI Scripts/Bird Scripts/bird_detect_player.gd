extends Node

signal colliding(vector_of_collision)

#var down_rays = ["Down", "DownLeft", "DownRight"]

var ray_dict = {
	"Up":Vector2.UP, # These vectors will be assigned clockwise
	"UpRight":Vector2(1,-1),
	"Right":Vector2.RIGHT,
	"DownRight":Vector2(1,1),
	"Down":Vector2.DOWN,
	"DownLeft":Vector2(-1,1),
	"Left":Vector2.LEFT,
	"UpLeft":Vector2(-1,-1)
	
}

func _physics_process(delta):
	
	for child in get_children():
		
		if child.is_colliding():
			
			
			emit_signal("colliding", ray_dict.get(child.name))
