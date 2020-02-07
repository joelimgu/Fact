extends TileMap

var mouse
var loc
var actual_cell_num

func _ready():
	create_cell(1,1,0)

#function to create a cell and append it to the dictionary to keep track of it
func create_cell(x, y, type):
#	create the tile
	set_cell(x,y,type)
#	if the data is blank, write it to the first if not, append a new one
#	i must change this, it was only for testing purposes, i have to edit the reference data for the dictionary to be balnk and only append here
	if Global.cells[0].id == null:
		Global.cells[0] = {
			"id": Global.max_ID +1,
			"x":x,
			"y":y,
			"type":type,
			"orientation":"S"	
		}
	else:
		Global.cells.append({
			"id": Global.max_ID +1,
			"x":x,
			"y":y,
			"type":type,
			"orientation":"S"	
		})
	#add one to the ID cap to avoid duplicated IDs in one world
	Global.max_ID +=1
		
	print(Global.cells)
	print("1st Item is:" + str(Global.cells[0].id))
	

#remove cell and remove from the dictionary
func remove_cell(x,y):
	var i = 0
	var c = Global.cells[i]
	set_cell(x,y,-1)
	while not(c.x == x and c.y == y):
		i +=1
		c = Global.cells[i]
		
	Global.cells.remove(i)
	if Global.cells.empty():
		Global.cells.append({
			"id": null,
			"x":null,
			"y":null,
			"type":null,
			"orientation":null
		})
		
	print("list afetr cell deleted:")
	print(Global.cells)
	
	
func _input(event):
	
	mouse = get_viewport().get_mouse_position()
	loc = world_to_map(mouse)
	actual_cell_num = get_cell(loc.x, loc.y)
	
	
	#I need to create tha table as expected and create a function to add and remove Cells from the table and then create an object to use on programing whose valuers are defined from tha table and a function to add it into the table.
	var L_click_pressed = Input.is_action_pressed("L_click")
	var there_is_no_cell_there = actual_cell_num == -1
	var the_machine_is_selected = get_tree().get_root().get_node("Main").Machine1_BTN
	
	if L_click_pressed && there_is_no_cell_there && the_machine_is_selected: #add tile selected 
			create_cell(loc.x, loc.y, 0)
	elif Input.is_action_pressed("R_click"):
		if actual_cell_num != -1:
			remove_cell(loc.x, loc.y)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
	



