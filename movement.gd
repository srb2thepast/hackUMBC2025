extends CharacterBody2D


var mouse_position = Vector2(0,0)
var t = 0.0

func get_mouse_position():
	print(mouse_position)
	
func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		mouse_position = event.position
		t=0
		print("Mouse Click/Unclick at: ", event.position)
		
	elif event is InputEventMouseMotion:
		print("Mouse Motion at: ", event.position)

func _physics_process(delta: float) -> void:
	t += delta * 0.1
	position = position.lerp(mouse_position,t)
	print(position)
	get_mouse_position()
	move_and_slide()
