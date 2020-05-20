extends Converter


func _on_generation_timeout():
	if haveEnoughResources():
		get_node("Sprite/AnimationPlayer").play("ingotCreation")
		get_node("Sprite/AnimationPlayer/GenerateRessourceTimer").start(0.4)


func _on_AutoUpdateTimer_timeout():
	updatePath()


func _on_Area2D_area_entered(area):
	addressource(area)


func _on_GenerateRessourceTimer_timeout():
	generateResource()
