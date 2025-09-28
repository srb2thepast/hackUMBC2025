extends CharacterBody2D

const PADDLE_SPEED := 600.0     # max speed (px/sec)
const GAIN := 15.0              # how aggressively we chase

func _physics_process(delta):
	var ball := $"../ball"
	var dist = ball.position.y - position.y
	# Convert “how far away” into a desired velocity (px/sec), then clamp
	velocity.y = clamp(dist * GAIN, -PADDLE_SPEED, PADDLE_SPEED)
	move_and_slide()
