extends RigidBody2D
class_name Cell


var id : int
var type : String = "generatorBase"
var orientation: String = "south"

# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
func initialize(id:int, type:String, orientation:String):
	self.id = id
	self.type = type
	self.orientation = orientation


func orientate(rotation: String, pos: Vector2):
	var newOrientation : String
	if pos == global.tileMap.world_to_map(self.position):
		if rotation == "clockwise":
			match self.orientation:
				"north": newOrientation = "east"
				"east" : newOrientation = "south"
				"south": newOrientation = "west"
				"west" : newOrientation = "north"
		
		self.orientation = newOrientation
		for N in global.cells.size():
			if global.cells[N].id == self.id:
				global.cells[N].orientation = self.orientation



