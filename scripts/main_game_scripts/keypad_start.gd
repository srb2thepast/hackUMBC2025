extends Button
@onready var PlayerBody:Node2D = Globals.getDependency("PlayerBody")
@onready var Keypad: Node2D = Globals.getDependency("KeypadWindow")
@onready var main_game = Globals.getDependency("MainGame")


func _pressed() -> void:
	if PlayerBody.can_move:
		print("keypad pressed!")
		var cam:Camera2D = Keypad.get_node("Keypad").get_node("Camera2D")
		main_game.setCam("Keypad")
		cam.enabled = true
