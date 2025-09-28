extends CharacterBody2D


@export var target_position = Vector2(0,0)
var t = 0.0

@onready var rooms = Globals.getDependency("Rooms")
@onready var main_game = Globals.getDependency("MainGame")


enum States {
	Dialouging,
	Arcading,
	Moving,
	Standing,
	Idle
}


@export var can_move = true

func _init() -> void:
	Globals.setDependency("PlayerBody",self)

func getPlayerNode():
	return get_parent()



func setCanMove(value):
	can_move = value

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		target_position = get_global_mouse_position()
		if main_game.curRoom == 1:
			var clampWall:CollisionShape2D = rooms.get_node("Room1").get_node("ClampZone")
			target_position = Vector2(clamp(target_position.x,clampWall.position.x-clampWall.shape.size.x,clampWall.position.x+clampWall.shape.size.x),
			clamp(target_position.y,clampWall.position.y,clampWall.position.y+clampWall.shape.size.y))
		if main_game.curRoom == 2:
			var clampWall:CollisionShape2D = rooms.get_node("Room2").get_node("ClampZone")
			target_position = Vector2(clamp(target_position.x,clampWall.position.x-clampWall.shape.size.x,clampWall.position.x+clampWall.shape.size.x),
			clamp(target_position.y,clampWall.position.y,clampWall.position.y+clampWall.shape.size.y))
		t=0
		#print("Mouse Click/Unclick at: ", event.position)
		
	elif event is InputEventMouseMotion:
		pass
		#print("Mouse Motion at: ", event.position)


func _physics_process(delta: float) -> void:
#	print(can_move)
	if (can_move):
		t += delta * (0.1 + clamp(10/(max(target_position.distance_to(position),10)+0.1),0,100))
		position = position.lerp(target_position,t)
		move_and_slide()
	else:
		position = position
