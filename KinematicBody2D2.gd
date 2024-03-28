extends KinematicBody2D

var velocity = Vector2()
var speed = 200
var gravity = 0

func _physics_process(delta):
	if(Input.is_action_pressed("ui_right")):
		velocity.x = speed
	elif(Input.is_action_pressed("ui_left")):
		velocity.x = -speed
	else:
		velocity.x = 0

	velocity.y += gravity * delta

	move_and_slide(velocity)
