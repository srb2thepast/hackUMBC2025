extends CharacterBody2D

var win_size : Vector2
const START_SPEED : int = 100
const ACCEL : int = 50
var speed : int
var dir : Vector2
const MAX_Y_VECTOR : float = 0.6
@onready var bounce: AudioStreamPlayer2D = $"../../bounce"

# Called when the node enters the scene tree for the first time.
func _ready():
	win_size = $"..".texture.get_size()

func new_ball():
	#randomize start position and direction
	var vr := get_viewport().get_visible_rect()
	global_position = vr.position + vr.size * 0.5
	speed = START_SPEED
	dir = random_direction()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision :KinematicCollision2D= move_and_collide(dir * speed * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		#if ball hits paddle
		if collider == $"../playerPaddle" or collider == $"../enemyPaddle":
			bounce.play()
			speed += ACCEL
			dir = dir.bounce(collision.get_normal())
		#if it hits a wall
		else:
			bounce.play()
			dir = dir.bounce(collision.get_normal())

func random_direction():
	var new_dir := Vector2()
	new_dir.x = [1, -1].pick_random()
	new_dir.y = randf_range(-1, 1)
	return new_dir.normalized()

func new_direction(collider):
	var ball_y = position.y
	var pad_y = collider.position.y
	var dist = ball_y - pad_y
	var new_dir := Vector2()
	
	#flip the horizontal direction
	if dir.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1
	new_dir.y = (dist / (collider.position.y)) * MAX_Y_VECTOR
	return new_dir.normalized()

func stop_ball():
	speed = 0
	dir = Vector2.ZERO
	velocity = Vector2.ZERO
