extends Node2D

@onready var player = Globals.getDependency("PlayerBody")
@onready var main_game = Globals.getDependency("MainGame")
@onready var hitbox:Area2D = get_node("Area2D")

@onready var rooms = Globals.getDependency("Rooms")

func switchRoom():
	main_game.switchScene(2)
	
	player.position = rooms.get_node("Room2").get_node("LeftmostStart").position

func collidesWith(incoming_hitbox:Area2D):
	print(incoming_hitbox.get_overlapping_areas())
	if (hitbox in incoming_hitbox.get_overlapping_areas()):
		switchRoom()
