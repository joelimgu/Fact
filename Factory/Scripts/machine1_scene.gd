extends Area2D

export var ingot_speed = 100
var id
var type = 0
var orientation = "S"
var loaded_ingot = preload("res://Sub_sceens/Iron.tscn")
var ingot

func ingot_direction(orientation):
	var V
	if orientation == "S":
		V = Vector2(-1,0)
	elif  orientation == "N":
		V = Vector2(1,0)
	elif orientation == "E":
		V = Vector2(0,1)
	elif orientation == "W":
		V = Vector2(0,-1)
	else:
		V = Vector2(-1,0)
		print("ERROR, orientation is not well defined")
	return V


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ingot = loaded_ingot.instance()
	if Global.frames_passed_sicnce_started % 60 == 0:
		get_tree().get_root().add_child(ingot,true)
		ingot.position = self.position
		ingot.linear_velocity = ingot_speed*ingot_direction(self.orientation)
		
