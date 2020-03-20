extends Node2D

var time

var save_world_path = "res://saves/saved_map.json"

var file = File.new()

var tile_map




#ist with all the nodes in the screen they are the actial nodes, not structured, bad id
var machines =[]

#variable used to assign new id to new cells
var max_assigned_ID

#actual dictionary with all the cell in the world info to store in json
var cells
#	[
#		{	"id": int,
#			"x":int,
#			"y":int,
#			"type":int,
#			"orientation":int (0-3)
#
#		}
#	]


var frames_passed_sicnce_started = 0
#also, the tilemap should be asubinstance of a bigger scnene with two sub-scenes 
#inside, one for the tilemap, and the other fro the manu and select buttins
#so no crappy region of no selection neededÌ†ΩÌ∏Å :)

#creates a reference of the data inside the dictionary
#this data structure is only used to store tha map in JSON
#during the program I'll be using andothe array and every dictionary in
#the array will be an instance of the machine class (conroled in machine 
#controler.gd)
var default_data = {"max_assigned_ID":0,"cells_list":[{
	"id": null,
	"x":null,
	"y":null,
	"type":null,
	"orientation":null
}]}


func load_game():
	pass
	#file.open(save_world_path, file.READ)


func load_file():
	file.open(save_world_path, file.READ)
		
	if not file.file_exists(save_world_path):
		file.open(save_world_path, file.WRITE)
		max_assigned_ID = 0
		file.store_string(to_json(default_data))
		file.close()
		file.open(save_world_path, file.READ)
		
	
	var text = file.get_as_text()
	max_assigned_ID = parse_json(text).max_assigned_ID
	cells = parse_json(text).cells_list
	
	file.close()
	load_game()


func assing_id():
	max_assigned_ID +=1
	return max_assigned_ID


func _ready():
	load_file()
	#tile_map = get_node("/root/Main/Machines")



# warning-ignore:unused_argument
func _process(delta):
	frames_passed_sicnce_started += 1
