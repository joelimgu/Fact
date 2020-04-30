extends Node


var time

var saveWorldPath = "res://saves/saved_map.json"

var file = File.new()

var map = load("res://subScenes/tileMap.tscn") as PackedScene

var tileMap

var conveyorbeltsDictionary = [0,1]






#ist with all the nodes in the screen they are the actual nodes, not structured, bad id
var machines =[]

#variable used to assign new id to new cells
var maxAssignedID

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


var framesPassedSicnceStarted = 0
#also, the tilemap should be asubinstance of a bigger scnene with two sub-scenes 
#inside, one for the tilemap, and the other fro the manu and select buttins
#so no crappy region of no selection neededÌ†ΩÌ∏Å :)

#creates a reference of the data inside the dictionary
#this data structure is only used to store tha map in JSON
#during the program I'll be using andothe array and every dictionary in
#the array will be an instance of the machine class (conroled in machine 
#controler.gd)
var defaultData = {"maxAssignedID":0,"cellsList":[{
	"id": null,
	"x":null,
	"y":null,
	"type":null,
	"orientation":null
}]}


func loadGame():
	pass
	#file.open(save_world_path, file.READ)


func loadFile():
	file.open(saveWorldPath, file.READ)
		
	if not file.file_exists(saveWorldPath):
		file.open(saveWorldPath, file.WRITE)
		maxAssignedID = 0
		file.store_string(to_json(defaultData))
		file.close()
		file.open(saveWorldPath, file.READ)
		
	
	var text = file.get_as_text()
	print("The var text loading file is :\n" + text + "\n(line 76 global.dg)\n")
	maxAssignedID = parse_json(text).maxAssignedID
	cells = parse_json(text).cellsList

	file.close()
	loadGame()


func assingID():
	maxAssignedID +=1
	return maxAssignedID


func _ready():
	loadFile()
	tileMap = map.instance()



# warning-ignore:unused_argument
func _process(delta):
	framesPassedSicnceStarted += 1
	
	
#its only working whtn the firs cell created is at the position for some reason
func findCell(mapCoordenates):
	var id = null
	for N in global.cells.size():
		if global.cells[N]["x"] == mapCoordenates.x && global.cells[N]["y"] == mapCoordenates.y:
			id = global.cells[N]["id"]
			print("the function findCell has found cell.id = " + str(id) +"\n(result of funciton ln 107 in global)")
	return id
		
		




