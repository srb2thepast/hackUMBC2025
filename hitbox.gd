extends CollisionShape2D

@onready var scene:Node2D = get_tree().root.get_child(0)
@onready var doors:Node = scene.get_node("Doors")


func _ready():
	print(scene)
	print(doors)
	


func _init():
	print("hi1")
