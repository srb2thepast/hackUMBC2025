extends Button
@onready var Player:Node2D = get_parent().get_parent().get_parent().get_node("Player")
@onready var PlayerBody:Node2D = Player.get_node("CharacterBody2D")


func _pressed() -> void:
	if PlayerBody.can_move:
		print("button pressed!")
		get_tree().change_scene_to_file("res://player.tscn")
