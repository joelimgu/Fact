extends Machine

export(int) var coalNeeded : int
export(int) var ironNeeded : int


func animatedGeneration():
	get_node("Sprite/AnimationPlayer").play("ingotCreation")
	get_node("Sprite/AnimationPlayer/GenerateRessourceTimer").start(0.4)
	

func _on_generation_timeout():
	animatedGeneration()


func _on_AutoUpdateTimer_timeout():
	updatePath()


func _on_GenerateRessourceTimer_timeout():
	generateResource()
