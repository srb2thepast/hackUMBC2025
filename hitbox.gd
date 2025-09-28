extends CollisionShape2D

@onready var main_game:Node2D = get_parent().get_parent().get_parent()
@onready var scene = main_game.get_node("Room1")
@onready var doors:Node = scene.get_node("Doors")
@onready var r1_to_r2_door:Node = doors.get_node("r1_to_r2")

func _ready():
	print(main_game)
	print(scene)
	print(scene.get_children())
	print(doors)
	print(r1_to_r2_door)
	

func _init():
	print("hi")
