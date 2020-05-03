extends Machine

export(int) var coalNeeded : int
export(int) var ironNeeded : int


func _on_generation_timeout():
	generateResource()


func _on_AutoUpdateTimer_timeout():
	updatePath()
