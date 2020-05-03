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
