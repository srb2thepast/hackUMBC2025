extends CharacterBody2D


var mouse_position = Vector2(0,0)
var t = 0.0



enum States {
	Dialouging,
	Arcading,
	Moving,
	Standing,
	Idle
}

@export var can_move = true

func setCanMove(value):
	can_move = value

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		mouse_position = event.position
		t=0
		#print("Mouse Click/Unclick at: ", event.position)
		
	elif event is InputEventMouseMotion:
		pass
		#print("Mouse Motion at: ", event.position)


func _physics_process(delta: float) -> void:
#	print(can_move)
	if (can_move):
		t += delta * 0.1
		position = position.lerp(mouse_position,t)
		move_and_slide()
	else:
		position = position
