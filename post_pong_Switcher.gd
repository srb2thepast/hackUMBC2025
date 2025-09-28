extends Node2D

#@onready var scenes = [$mainGame/Room1]
@onready var rooms = Globals.getDependency("Rooms")
@onready var camera:Camera2D = Globals.getDependency("Camera")
@export var curRoom = 2
	
func _init():
	Globals.setDependency("MainGame",self)

func switchScene(number):
	print(rooms)
	curRoom = number
	var index = number-1
	#var targetScene = scenes[index]
	camera.position = Vector2(max(0,index * 577*2+10),0)

func setCam(type):
	if type == "Keypad":
		camera.enabled = false
		
	else:
		camera.enabled = true

func _ready():
	switchScene(2)



func _on__pressed_3() -> void:
	pass # Replace with function body.


func _on__pressed_4() -> void:
	pass # Replace with function body.


func _on__pressed_5() -> void:
	pass # Replace with function body.


func _on__pressed_6() -> void:
	pass # Replace with function body.


func _on__pressed_7() -> void:
	pass # Replace with function body.


func _on__pressed_8() -> void:
	pass # Replace with function body.


func _on__pressed_9() -> void:
	
	pass # Replace with function body.


func _on__pressed_0() -> void:
	pass # Replace with function body.
