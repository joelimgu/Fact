extends RigidBody2D

export var ingot_speed = 100
var id
var type = 0
var orientation = 2
var loaded_ingot = preload("res://Sub_sceens/Iron_sprite.tscn")
var ingot


#creates tha path fro the created object to follow
func set_path():
	get_node("Path2D").curve.add_point(Global.tile_map.map_to_world(Vector2(0,0)))
	get_node("Path2D").curve.add_point(Global.tile_map.map_to_world(Vector2(0,1)))
	if Global.tile_map.get_cell(0,1) in Global.conveyorbelts_disctionary:
			print("true")
	else:
		print("false")
	print(Global.tile_map.get_cell(0,1))


func _ready():
	set_path()
	

func ingot_direction(orientation_loc):
	var Vect
	match orientation_loc:
		0: Vect = Vector2(0,-1)
		1: Vect = Vector2(1,0)
		2: Vect = Vector2(0,1)
		3: Vect = Vector2(-1,0)
		
	return Vect


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	#calls every x frames and creates an ingot
	if Global.frames_passed_sicnce_started % 60 == 0:
		#ingot = loaded_ingot.instance()
		#get_tree().get_root().add_child(ingot)
		#get_node("Path2D/PathFollow2D").add_child(ingot)
		#ingot.position = self.position
		#ingot.linear_velocity = ingot_speed*ingot_direction(self.orientation)
		#ingot.from_node_ID = self.id
		
		#ingot = loaded_ingot.instance()
		#get_node("Path2D/PathFollow2D").add_child(ingot)
		get_node("Path2D/PathFollow2D").offset +=5
		
		
		
func _on_Machine_body_entered(body):
	pass


