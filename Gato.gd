extends KinematicBody2D

#signal hit

onready var camera = $Camera2D
onready var player = get_tree().get_nodes_in_group("Gato")

export var speed = 1000 # How fast the player will move (pixels/sec).
var screen_size
var collision
var points = 1

var timer2 = Timer.new()
var timer = Timer.new()  # Crea un nuevo Timer

var step_sound1 = load("res://Assets/audios/pasos/paso1.ogg")
var step_sound2 = load("res://Assets/audios/pasos/paso2.ogg")

# Variable para llevar la cuenta de los pasos
var step_count = 0	


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

	pass

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var velocity = Vector2()  # The player's movement vector.
	
	var player = get_node("paso1")
	# Si el personaje está caminando
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
		if not player.is_playing():
			step_count += 1
			
			if step_count % 2 == 0:
				player.stream = step_sound1
			else:
				player.stream = step_sound2
			
			player.play()
	else:
		 player.stop()
	
	
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	#position += velocity * delta
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)
	
	if velocity.x != 0:

		$AnimatedSprite.flip_v = false
		# See the note below about boolean assignment
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:

		$AnimatedSprite.flip_v = velocity.y > 0
	
	move_and_slide(velocity * delta)
	

