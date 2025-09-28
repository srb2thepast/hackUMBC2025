extends Node

var score = 0
@onready var win_label: Label = $"../Player2/Camera2D/Win_Label"

@onready var timer: Timer = $Timer

@onready var score_label: Label = $ScoreLabel

func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " disks."
	if check_win() == true:
		win_label.text = "You Win!"
		timer.start()

func check_win():
	if score == 3:
		return true
	else:
		return false

func end_game():
	return null
	


func _on_timer_timeout() -> void:
	get_tree().quit()
