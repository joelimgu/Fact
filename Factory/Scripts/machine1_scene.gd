extends Area2D

export var ingot_speed = 100
var id
var type = 0
var orientation = "S"
var loaded_ingot = preload("res://Sub_sceens/Iron.tscn")
var ingot

func ingot_direction(orientation):
	var Vect
	match orientation:
		0: Vect = Vector2(0,-1)
		1: Vect = Vector2(1,0)
		2: Vect = Vector2(0,1)
		3: Vect = Vector2(-1,0)
		
	return Vect


func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.frames_passed_sicnce_started % 60 == 0:
		ingot = loaded_ingot.instance()
		get_tree().get_root().add_child(ingot,true)
		ingot.position = self.position
		ingot.linear_velocity = ingot_speed*ingot_direction(self.orientation)
		
