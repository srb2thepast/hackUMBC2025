extends Node


@export var sceneDoors: Array[Node2D]
@onready var HallwayDoorCollider: Node2D = $HallwayDoor/CollisionShape2D

func _init():
	sceneDoors.append(HallwayDoorCollider)
