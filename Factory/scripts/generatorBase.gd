extends RigidBody2D


export(float) var ingotSpeed: float = 1
export(int) var generationSpeed : int = 1
var id : int
var type : String = "coalGenerator"
var orientation: String = "south"
const loadedResourceFollowPath2D = preload("res://subScenes/PathFollow2DForMaterials.tscn")
var loadedResource = preload("res://subScenes/ingotBase.tscn")
var pathDone : Vector2


func updatePath():
	pathDone = Vector2(0,0)
	get_node("Path2D").curve.clear_points()
	setPath()
	

#creates tha path for the created object to follow
func setPath():
	addPointToPath("Path2D", Vector2(0,0))
	addPointToPath("Path2D", Vector2(0,1))
	continuePath()
	

func continuePath():
	var nextCellInPath
	var pointToAdd : Vector2
	
	nextCellInPath = global.findCell(pathDone + global.tileMap.world_to_map(self.position))
	if nextCellInPath != null:
		if global.conveyorbeltsList.has(nextCellInPath.type):
			pointToAdd = global.getNextRelativePlaceForPath(nextCellInPath.type)
			addPointToPath("Path2D",pointToAdd)
			continuePath()
	else:
		pass


func _ready():
	get_node("Timer").wait_time = generationSpeed


func addPointToPath(nodePathToAddTo: String,vectorToAdd: Vector2):
	pathDone += vectorToAdd
	get_node(nodePathToAddTo).curve.add_point(global.tileMap.map_to_world(pathDone) + Vector2(64,64))




#usesless funciton ready to delet theoreticly
func ingot_direction(orientation_loc):
	var Vect
	match orientation_loc:
		0: Vect = Vector2(0,-1)
		1: Vect = Vector2(1,0)
		2: Vect = Vector2(0,1)
		3: Vect = Vector2(-1,0)
		
	return Vect


func generateResource():
	var resourceFollowPath2D
	var resource = loadedResource.instance()
	resourceFollowPath2D = loadedResourceFollowPath2D.instance()
	resourceFollowPath2D.add_child(resource)
	resourceFollowPath2D.speed = ingotSpeed
	get_node("Path2D").add_child(resourceFollowPath2D)


func _on_Timer_timeout():
	generateResource()
	

func orientate(newOrientation: String, pos: Vector2):
	if pos == global.tileMap.world_to_map(self.position):
		self.orientation = newOrientation
		get_tree().call_group("arrows", "updateOrientation")


func _on_AutoUpdateTimer_timeout():
	updatePath()
