extends Area2D

var loaded_ingot = preload("res://Sub_sceens/Iron.tscn")
var ingot


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ingot = loaded_ingot.instance()
	if Global.frames_passed_sicnce_started % 60 == 0:
		print("3")
		self.call_deferred("add_child()",ingot,true)
		ingot.position = self.position
