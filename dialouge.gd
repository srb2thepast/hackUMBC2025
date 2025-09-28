extends Node2D

@onready var displayed_text = $DisplayText
@onready var player = get_parent().get_node("Player")
@onready var playerBody = player.get_node("CharacterBody2D")


var dialougeList = {
	introduction = [
		"I entered a bet",
		"now im here",
		"and im aboitu to meep a creepy old guy oh nooo n o no o"
		
	],
	f = [
		
		
	]
}
var dialouge_ended = false

var cur_dialouge_index = "introduction"
var cur_dialouge_advancement = 0

func set_dialouge(index,start=0):
	scale = Vector2.ONE
	cur_dialouge_index = index
	cur_dialouge_advancement = start
	displayed_text.text = getCurDialouge()

	
func hide_dialouge():
	scale = Vector2.ZERO
	
func getCurDialouge():
	return dialougeList[cur_dialouge_index][cur_dialouge_advancement] 
	
func advance_dialouge():
	cur_dialouge_advancement+= 1
	if (cur_dialouge_advancement < len(dialougeList[cur_dialouge_index])):
		displayed_text.text = getCurDialouge()
	else:
		dialouge_ended = true

	return dialouge_ended

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if advance_dialouge() == true:
			print(player)
			playerBody.setCanMove(true)
			hide_dialouge()
		else:
			playerBody.setCanMove(false)

func _ready() -> void:
	displayed_text.text = "waiting for dialouge..."
	print(Vector2.UP)
