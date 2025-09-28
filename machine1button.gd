extends Button
@onready var PlayerBody:Node2D = Globals.getDependency("PlayerBody")


func _pressed() -> void:
	if PlayerBody.can_move:
		print("button pressed!")
		get_tree().change_scene_to_file("res://player.tscn")
