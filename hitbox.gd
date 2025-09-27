extends CollisionShape2D

@onready var scene:Node2D = get_parent().get_parent().get_parent()
@onready var doors:Node = scene.get_node("Doors")
@onready var r1_to_r2_door:Node = doors.get_node("r1_to_r2")

func _ready():
	print(scene)
	print(scene.get_children())
	print(doors)
	print(r1_to_r2_door)

func _on_area

func _init():
	print("hi")
