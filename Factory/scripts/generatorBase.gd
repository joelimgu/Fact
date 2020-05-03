extends Machine


func _on_generation_timeout():
	generateResource()




func _on_AutoUpdateTimer_timeout():
	updatePath()
