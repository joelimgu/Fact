extends Node2D

var Machine1_BTN = false
var hovering_a_BTN = false



func coordinate():
	for i in Global.cells.size():
		instance_machine(Global.cells[i])
		#print(i)
	

# warning-ignore:unused_argument
func instance_machine(cell):
# warning-ignore:unused_variable
	#var machine1 
	#machine1 = Machine_Controler.machine.new()
	#machines.append(machine)
	pass


# warning-ignore:unused_argument
func _process(delta):
	coordinate()
	




func _on_Machine1_BTN_pressed():
	if Machine1_BTN:
		Machine1_BTN = false
	else:
		Machine1_BTN = true
	

func _on_Button_button_down():
	print(Global.cells)
	print(get_tree().get_node_count())
	
	
