extends Node2D

var cur_Input = ""
@onready var input_field = get_node("Input")

var code = "23874"


func _init():
	Globals.setDependency("KeypadWindow",self)
	
	
func updateText(text):
	cur_Input = text
	if len(text) >= 5:
		if text == code:
			input_field.text = text
			print("win")
		else:
			input_field.text = "WRONG"
	else:
		input_field.text = text
	


func _on__pressed_1() -> void:
	updateText(cur_Input + "1")
	pass # Replace with function body.


func _on__pressed_2() -> void:
	updateText(cur_Input + "2")
	pass # Replace with function body.


func _on__pressed_0() -> void:
	updateText(cur_Input + "0")
	pass # Replace with function body.


func _on__pressed_9() -> void:
	updateText(cur_Input + "9")
	pass # Replace with function body.


func _on__pressed_8() -> void:
	updateText(cur_Input + "8")
	pass # Replace with function body.


func _on__pressed_7() -> void:
	updateText(cur_Input + "7")
	pass # Replace with function body.


func _on__pressed_6() -> void:
	updateText(cur_Input + "6")
	pass # Replace with function body.


func _on__pressed_4() -> void:
	updateText(cur_Input + "4")
	pass # Replace with function body.


func _on__pressed_3() -> void:
	updateText(cur_Input + "3")
	pass # Replace with function body.


func _on__pressed_5() -> void:
	updateText(cur_Input + "5")
	pass # Replace with function body.


func _on__pressed_clear() -> void:
	updateText("")
	pass # Replace with function body.
