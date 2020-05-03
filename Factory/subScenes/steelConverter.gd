extends "res://scripts/converterBase.gd"

func _init():
	self.type = "steelConverter"
	._init()
	setConverterMateriels("ironIngot", "coalIngot","none","none", 2,1,0,0)
