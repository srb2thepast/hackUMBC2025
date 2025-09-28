extends Node2D

@onready var displayed_text = $DisplayText
@onready var playerbody = Globals.getDependency("PlayerBody")


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
		visible = true
		start_animation()
		#displayed_text.text = getCurDialouge()
	else:
		dialouge_ended = true
		visible = false

	return dialouge_ended

func start_animation():
	t=0


var t = 0
func _process(delta: float) -> void:
	t += 40*delta
	if not dialouge_ended:
		var dialouge_focus:String = getCurDialouge()
		var progress = clamp(int(t),1,len(dialouge_focus))
		print(progress)
		displayed_text.text = dialouge_focus.substr(0,progress)

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if advance_dialouge() == true:
			playerbody.setCanMove(true)
			hide_dialouge()
		else:
			playerbody.setCanMove(false)

func _ready() -> void:
	displayed_text.text = "waiting for dialouge..."
	print(Vector2.UP)
