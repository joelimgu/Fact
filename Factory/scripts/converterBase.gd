extends Converter


func _on_generation_timeout():
	generateResource()


func _on_AutoUpdateTimer_timeout():
	updatePath()


func _on_Area2D_area_entered(area):
	addressource(area)
