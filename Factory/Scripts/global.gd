extends Node

var time

var save_world_path = "res://saves/saved_map.json"

var file = File.new()

var machines =[]

var max_ID
var cells
#also, tthe tilemap should be asubinstance of a bigger scnene with two sub-scenes 
#inside, one for the tilemap, and the other fro the manu and select buttins
#so no crappy region of no selection neededÌ†ΩÌ∏Å :)

#creates a reference of the data inside the dictionary
#this data structure is only used to store tha map in JSON
#during the program I'll be using andothe array and every dictionary in
#the array will be an instance of the machine class (conroled in machine 
#controler.gd)
var default_data = {"max_ID":0,"cells_list":[{
	"id": null,
	"x":null,
	"y":null,
	"type":null,
	"orientation":null
}]}


func _ready():
	file.open(save_world_path, file.READ)
	
	if not file.file_exists(save_world_path):
		file.open(save_world_path, file.WRITE)
		max_ID = 0
		file.store_string(to_json(default_data))
		file.close()
		file.open(save_world_path, file.READ)
		
	
	var text = file.get_as_text()
	max_ID = parse_json(text).max_ID
	cells = parse_json(text).cells_list
	
	file.close()


func load_game():
	pass
	#file.open(save_world_path, file.READ)
	

func _process(delta):
	Timer
