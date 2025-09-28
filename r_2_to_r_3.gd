extends Node2D

@onready var player = Globals.getDependency("PlayerBody")
@onready var main_game = Globals.getDependency("MainGame")
@onready var hitbox:Area2D = get_node("Area2D")

@onready var rooms = Globals.getDependency("Rooms")

func switchRoom():
	main_game.switchScene(3)
	
	var spos = rooms.get_node("Room3").get_node("START").position
	player.position =  spos
	player.target_position = spos

func collidesWith(incoming_hitbox:Area2D):
	print(incoming_hitbox.get_overlapping_areas())
	if (hitbox in incoming_hitbox.get_overlapping_areas()):
		switchRoom()
