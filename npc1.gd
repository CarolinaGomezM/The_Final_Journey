extends KinematicBody2D

var speed = 30
var direction = 1
var gravity = 900



func _ready():
	randomize_direction()

func _physics_process(delta):
	var velocity = Vector2(speed * direction, 0)
	velocity.y += gravity * delta
	move_and_slide(velocity, Vector2.UP)
	
#	if (get_slide_count() >0):
#		for i in range(get_slide_count()):
#			if "Gato" in get_slide_collision(i).collider.name:
#				print_debug("ENTREEE")



func randomize_direction():
	if rand_range(-1, 1) > 0:
		direction = 1
	else:
		direction = -1
	yield(get_tree().create_timer(rand_range(2, 5)), "timeout")
	randomize_direction()


	
