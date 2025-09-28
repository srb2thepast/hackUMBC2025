extends CollisionShape2D

@onready var main_game:Node2D = Globals.getDependency("MainGame")

func _ready():
	pass
	#print(r1_to_r2_door)

func _physics_process(_delta: float) -> void:
	var doors = Globals.getLateDependency("DoorsList")
	for door:Node2D in doors:
		if door.collidesWith(get_parent()):
			door.switchRoom()
