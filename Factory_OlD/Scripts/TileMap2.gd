extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mouse
var loc
var cell


# warning-ignore:unused_argument
func a(delta):
	mouse = get_viewport().get_mouse_position()
	loc = world_to_map(mouse)
	cell = get_cell(loc.x, loc.y)
	if cell == -1:
		set_cell(loc.x, loc.y, 0)
	
	
	
