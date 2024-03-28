extends KinematicBody2D

var body_in_area = null

var speed = 30
var direction = 1
var gravity = 0
var cont = 0;
var maxfood = 3
var hasta_siguiente_comida = Timer.new()
var idle = false


signal gave_food(amount)
signal punched(amount)

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(hasta_siguiente_comida)
	hasta_siguiente_comida.connect("timeout",self,"_on_Timer_timeout")
	hasta_siguiente_comida.wait_time = 5
	randomize_direction()
	$AnimationPlayer.connect("animation_finished", self, "_on_AnimationPlayer_animation_finished")
	$AnimationPlayer.play("Walk")

var state = "idle"
var proob = 0
func _process(delta):
	if not idle and state != "Food" and state != "hit":
		var velocity = Vector2(speed * direction, 0)
		velocity.y += gravity * delta
		move_and_slide(velocity, Vector2.UP)
		$Sprite.flip_h = direction == -1
		proob = 0
		if state != "die":
			if speed != 0:
				$AnimationPlayer.play("Walk")
	elif state != "Food" and state != "hit" and proob == 0 and state != "die":
		$AnimationPlayer.play("Idle")
		proob = 1
	
	if body_in_area and body_in_area.name == "Gato" and Input.is_action_just_pressed("Interaction") and state != "die":
		cont += 1
		if cont == 3:
			var accion = randi() % 100 + 1
			print_debug(accion)
			cont = 0
			if accion <= 40:
				var numero_aleatorio = randi() % 40 + 1
				$AnimationPlayer.stop()
				speed = 0
				$AnimationPlayer.play("hit")
				state = "hit"
				emit_signal("punched",numero_aleatorio)
			else:
				maxfood -= 1
				if(maxfood <= 0):
					hasta_siguiente_comida.start()
					print_debug("Mucha comida")
				else:
					var food = randi() % 35 + 1
					$AnimationPlayer.stop()
					speed = 0
					$AnimationPlayer.play("Food")
					state = "Food"
					emit_signal("gave_food",food)

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "hit" or anim_name == "Food":
		# Si la animación que acaba de terminar es 'hit' o 'Food', cambia el estado a 'idle'
		state = "idle"
		# Restablece la velocidad a su valor original
		speed = 30
		# Reproduce la animación "Walk"
		


func _on_Area2D_body_entered(body):
	body_in_area = body
	if body.name == "Gato" and body_in_area == body:
		yield(get_tree().create_timer(.3), "timeout")
		var sprite = get_node("AnimatedSprite") 
		sprite.show()
		#sprite.play("nombre_de_tu_animacion")  # Cambia "nombre_de_tu_animacion" al nombre de la animación que quieres reproducir
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	if body.name == "Gato" and body ==  body_in_area:
		var sprite = get_node("AnimatedSprite")
		sprite.hide()
		body_in_area = null
	pass # Replace with function body.

func randomize_direction():
	if state != "idle":
		if state != "die":
			if speed != 0:
				$AnimationPlayer.play("Walk")
		if rand_range(-1, 1) > 0:
			direction = 1
		else:
			direction = -1

	if state != "die":
		idle = rand_range(0, 1) < 0.5
	else:
		idle = 0

	yield(get_tree().create_timer(rand_range(2, 5)), "timeout")
	randomize_direction()


func _on_Timer_timeout():
	maxfood = 3
	print_debug("Ya puedes pedirme comida otra vez: ", maxfood)


func _on_Node2D_last_breath():
	state="die"
	
	pass # Replace with function body.
