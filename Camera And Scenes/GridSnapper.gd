extends Position2D

var grid_size = Vector2(320,180)
var grid_position = Vector2()

onready var player = get_node("../Player")
onready var camera = get_node("SceneCamera")

func _ready():

	update_grid_position()
	
func _physics_process(delta):
	
	update_grid_position()
	
func update_grid_position():
	var x = round(player.position.x / grid_size.x)
	var y = round(player.position.y / grid_size.y)
	var new_grid_position = Vector2(x,y)
	
	if grid_position == new_grid_position:
		return
	
	grid_position = new_grid_position
	camera.move_camera(grid_position * grid_size)
	
