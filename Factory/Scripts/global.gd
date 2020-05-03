extends Node

const conveyorbeltsList =  ["rightConveyorBelt"]

const saveWorldPath = "res://saves/saved_map.json"

var time

var map = load("res://subScenes/tileMap.tscn") as PackedScene

var tileMap

var cellSelected : String = "ironGenerator"

#ist with all the nodes in the screen they are the actual nodes, not structured, bad id
var machines =[] #shuld be replaceable by getting the Machine childs list

#variable used to assign new id to new cells
var maxAssignedID: int

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


var framesPassedSicnceStarted: int = 0
#also, the tilemap should be asubinstance of a bigger scnene with two sub-scenes 
#inside, one for the tilemap, and the other fro the manu and select buttins
#so no crappy region of no selection neededí ½í¸ :)

#creates a reference of the data inside the dictionary
#this data structure is only used to store tha map in JSON
#during the program I'll be using andothe array and every dictionary in
#the array will be an instance of the machine class (conroled in machine 
#controler.gd)
const defaultData = {"maxAssignedID":0,"cellsList":[{
	"id": null,
	"x":null,
	"y":null,
	"type":null,
	"orientation":null
}]}


func loadGame():
	pass
	#file.open(save_world_path, file.READ)


func loadSaveFile():
	var file = File.new()
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
	loadSaveFile()
	tileMap = map.instance()


# warning-ignore:unused_argument
func _process(delta):
	framesPassedSicnceStarted += 1
	
	
#returns the cell with the indicated coordinates
func findCell(mapCoordenates: Vector2):
	var cell = null
	for N in global.cells.size():
		if global.cells[N]["x"] == mapCoordenates.x && global.cells[N]["y"] == mapCoordenates.y:
			cell = global.cells[N]
	return cell
		
		
func getOrientationID(orientation: String):
	var orientationID: int = 2
	match orientation:
		"north" : orientationID = 0
		"east" : orientationID = 1
		"south" : orientationID = 2
		"west" : orientationID = 3
	return orientationID


func readJSONFile(path: String):
	var file = File.new()
	file.open(path, file.READ)
	var text = file.get_as_text()
	return parse_json(text)


func getScenePath(machine : String) -> String:
	var path : String
	match machine :
		"ironGenerator" : path = "res://subScenes/ironGenerator.tscn"
		"rightConveyorBelt": path = "res://subScenes/rightConveyorBelt.tscn"
		"coalGenerator": path = "res://subScenes/coalGenerator.tscn"
		"steelTransformer": path = "res://subScenes/steelTransformer.tscn"
		_ : path = "res://subScenes/generatorBase.tscn"
	
	return path


func getRessourcePath(machineType : String) -> String:
	var path: String
	match machineType:
		"generatorBase" : path = "res://subScenes/ingotBase.tscn"
		"ironGenerator" : path = "res://subScenes/ironIngot.tscn"
		"coalGenerator" : path = "res://subScenes/coalIngot.tscn"		
		_ : path = "res://subScenes/ingotBase.tscn"
	
	return path
	
	
func getNextRelativePlaceForPath(foudCell: String) -> Vector2:
	var vectorToReturn : Vector2
	match foudCell:
		"rightConveyorBelt" : vectorToReturn = Vector2(1,0)
	return vectorToReturn
