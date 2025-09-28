extends Node2D

const WIN_SCORE := 3
var score := [0, 0] # [Player, CPU]
var game_over := false

@onready var ball := $SolidBlack/ball
@onready var player_lbl := $HUD/playerScore
@onready var cpu_lbl := $HUD/cpuScore
@onready var restart_lbl = $HUD/message2
@onready var space_lbl = $HUD/message3
@onready var serve_timer := $BallTimer 
@onready var win_sound: AudioStreamPlayer2D = $win_sound
@onready var lose_sound_1: AudioStreamPlayer2D = $lose_sound_1
@onready var lose_sound_2: AudioStreamPlayer2D = $lose_sound_2
@onready var goal: AudioStreamPlayer2D = $goal

func _ready():
	update_hud()
	restart_lbl.hide()
	space_lbl.hide()

func _on_ball_timer_timeout() -> void:
	if not game_over:
		ball.new_ball()

# CPU scored (ball entered player's goal)
func _on_player_goal_body_entered(_body: Node2D) -> void:
	goal.play()
	if game_over: return
	score[1] += 1
	update_hud()
	if not check_win():
		ball.new_ball()

# Player scored (ball entered enemy's goal)
func _on_enemy_goal_body_entered(_body: Node2D) -> void:
	goal.play()
	if game_over: return
	score[0] += 1
	update_hud()
	if not check_win():
		ball.new_ball()

func update_hud():
	player_lbl.text = str(score[0])
	cpu_lbl.text = str(score[1])

func check_win() -> bool:
	if score[0] >= WIN_SCORE:
		end_match(true)
		return true
	elif score[1] >= WIN_SCORE:
		end_match(false)
		return true
	return false

func end_match(player_won: bool) -> void:
	game_over = true
	serve_timer.stop()
	ball.stop_ball()  # see ball.gd helper below
	
	if (player_won == true):
		win_sound.play()
		$HUD/message.text = "YOU WIN!"
		$HUD/message.show()
		restart_lbl.show()
		space_lbl.show()
		get_tree().change_scene_to_file("res://post_pong.tscn")
		

	else:
		lose_sound_1.play()
		lose_sound_2.play()
		$HUD/message.text = "YOU LOSE!"
		$HUD/message.show()
		restart_lbl.show()
		space_lbl.show()

# restart with Enter/Space (ui_accept)
func _unhandled_input(event):
	if game_over and event.is_action_pressed("restart"):
		score = [0, 0]
		update_hud()
		game_over = false
		$HUD/message.hide()
		restart_lbl.hide()
		space_lbl.hide()
		ball.new_ball()
