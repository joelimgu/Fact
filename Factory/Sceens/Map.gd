extends Node2D

var Machine1_BTN = false
var hovering_a_BTN = false



func _on_Machine1_BTN_pressed():
	if Machine1_BTN:
		Machine1_BTN = false
	else:
		Machine1_BTN = true
	print(Machine1_BTN)
	


func _on_Button_button_down():
	print(Global.cells)
	
	
