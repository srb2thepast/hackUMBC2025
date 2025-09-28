extends Node2D

#@onready var scenes = [$mainGame/Room1]
@onready var rooms = Globals.getDependency("Rooms")

func _init():
	Globals.setDependency("MainGame",self)

func switchScene(number):
	print(rooms)
	var index = number-1
	#var targetScene = scenes[index]
	rooms.position = Vector2(index * 1960,0)

func _ready():
	switchScene(1)
