extends Machine

export(int) var coalNeeded : int
export(int) var ironNeeded : int


func _on_generation_timeout():
	get_node("Sprite/AnimationPlayer").play("ingotCreation")
	print("played")
	generateResource()


func _on_AutoUpdateTimer_timeout():
	updatePath()
