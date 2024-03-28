extends Area2D

var speed = 30
var direction_x = 1

func _ready():
	randomize_direction()

func _physics_process(delta):
	position.x += speed * direction_x * delta
	# Si la dirección es -1 (izquierda), invertimos el sprite. Si es 1 (derecha), lo dejamos normal.
	scale.x = direction_x

func randomize_direction():
	if rand_range(-1, 1) > 0:
		direction_x = 1
	else:
		direction_x = -1

	yield(get_tree().create_timer(rand_range(2, 5)), "timeout")
	randomize_direction()
