extends Node2D

func _init():
	Globals.setDependency("Doors",self)
	
func _ready():
	Globals.setLateDependency("DoorsList",[get_node("r1_to_r2"),get_node("r2_to_r1")])
	
