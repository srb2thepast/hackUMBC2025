extends CollisionShape2D

@onready var main_game:Node2D = Globals.getDependency("MainGame")
@onready var doors:Node = Globals.getDependency("Doors")

func _ready():
	pass
	#print(r1_to_r2_door)

func _physics_process(delta: float) -> void:
	main_game.switchScene(1)
