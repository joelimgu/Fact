extends Cell
class_name Machine


export(float) var ingotSpeed: float = 1
export(int) var generationSpeed : int = 1
const loadedResourceFollowPath2D = preload("res://subScenes/PathFollow2DForMaterials.tscn")

var pathDone : Vector2
var loadedResource = preload("res://subScenes/ingotBase.tscn")


func _init():
	self.ingotSpeed = ingotSpeed
	self.generationSpeed = generationSpeed

func initialize(id:int, type:String, orientation:String):
	.initialize(id, type, orientation)
	self.pathDone = Vector2(0,0)
	self.loadedResource = load(global.getRessourcePath(self.type))
	
	

func updatePath():
	self.pathDone = Vector2(0,0)
	get_node("Path2D").curve.clear_points()
	setPath()
	

	

#creates tha path for the created object to follow
func setPath():
	addPointToPath("Path2D", Vector2(0,0))
	addPointToPath("Path2D", ingot_direction(self.orientation))
	continuePath()
	

func continuePath():
	var nextCellInPath
	var pointToAdd : Vector2
	
	nextCellInPath = global.findCell(self.pathDone + global.tileMap.world_to_map(self.position))
	if nextCellInPath != null:
		if global.conveyorbeltsList.has(nextCellInPath.type) && get_node("Path2D").curve.get_point_count() < 1000:
			pointToAdd = global.getNextRelativePlaceForPath(nextCellInPath.type)
			addPointToPath("Path2D",pointToAdd)
			continuePath()
	else:
		pass


func _ready():
	get_node("generation").wait_time = self.generationSpeed


func addPointToPath(nodePathToAddTo: String,vectorToAdd: Vector2):
	self.pathDone += vectorToAdd
	get_node(nodePathToAddTo).curve.add_point(global.tileMap.map_to_world(self.pathDone) + Vector2(64,64))
	
#usesless funciton ready to delet theoreticly
func ingot_direction(orientation : String):
	var Vect
	match orientation:
		"north": Vect = Vector2(0,-1)
		"east" : Vect = Vector2(1,0)
		"south": Vect = Vector2(0,1)
		"west" : Vect = Vector2(-1,0)
		
	return Vect


func generateResource():
	var resourceFollowPath2D
	var resource = self.loadedResource.instance()
	resourceFollowPath2D = loadedResourceFollowPath2D.instance()
	resourceFollowPath2D.add_child(resource)
	resourceFollowPath2D.speed = self.ingotSpeed
	get_node("Path2D").add_child(resourceFollowPath2D)
	

func orientate(rotation: String, pos: Vector2):
	.orientate(rotation, pos)
	if pos == global.tileMap.world_to_map(self.position):
		get_tree().call_group("arrows", "updateOrientation")
		
