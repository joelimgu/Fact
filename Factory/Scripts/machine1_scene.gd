extends Area2D

export var ingot_speed = 100
var id
var type = 0
var orientation = 2
var loaded_ingot = preload("res://Sub_sceens/Iron.tscn")
var ingot

func _ready():
	pass
	

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
		ingot = loaded_ingot.instance()
		get_tree().get_root().add_child(ingot)
		ingot.position = self.position
		ingot.linear_velocity = ingot_speed*ingot_direction(self.orientation)
		ingot.from_node_ID = self.id


func _on_Machine_body_entered(body):
	print(body)
	print("aaa")
