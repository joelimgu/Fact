extends Node


var save_world_path = "res://saves/saved_map.json"

var file = File.new()

var cells


var default_data = [{
	"id": null,
	"x":null,
	"y":null,
	"type":null,
	"orientation":null
}]	


func _ready():
	file.open(save_world_path, file.READ)
	
	if not file.file_exists(save_world_path):
		file.open(save_world_path, file.WRITE)
		file.store_string(to_json(default_data))
		file.close()
		file.open(save_world_path, file.READ)
		
	
	var text = file.get_as_text()
	cells = parse_json(text)
	
	print(cells)
	file.close()


func load_game():
	pass
	#file.open(save_world_path, file.READ)
	




class Cell:
	var loc
	var type
	
	func _init(x, y, t):
		loc = Vector2(x,y)
		type = t
	
