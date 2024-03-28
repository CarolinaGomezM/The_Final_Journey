extends KinematicBody2D

var body_in_area = null

var speed = 30
var direction = 1
var gravity = 0
var cont = 0;
var maxfood = 1
var hasta_siguiente_comida = Timer.new()
var otra_interaccion = Timer.new()
var idle = false


signal gave_food(amount)
signal punched(amount)


# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(otra_interaccion)
	otra_interaccion.connect("timeout",self,"_on_Timer_timeout2")
	otra_interaccion.wait_time = 10
	$AnimationPlayer.play("Idle")

var state = "idle"
var proob = 0
var mycont = true
func _process(delta):	
	if body_in_area and body_in_area.name == "Gato" and Input.is_action_just_pressed("Interaction") and mycont == true:
			$AnimationPlayer.play("Food")
			otra_interaccion.start()
			var accion = randi() % 100 + 1
			mycont = false
			if accion <= 30:
					var numero_aleatorio = randi() % 30 + 1
					print_debug("comida en mal estado", numero_aleatorio)
					state = "hit"
					emit_signal("punched",numero_aleatorio)
			elif accion >= 31 or accion <=41:
					var numero_aleatorio = randi() % 30 + 1
					print_debug("comida en mal estado", numero_aleatorio)
					state = "hit"
					emit_signal("punched",numero_aleatorio)
				
			else:
					maxfood -= 1
					var food = randi() % 35 + 1
					print_debug("Buena comidaa", food)
					state = "Food"
					emit_signal("gave_food",food)


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

	
func _on_Timer_timeout2():
	mycont = true
	$AnimationPlayer.play("Idle")
	print_debug("Ya puedes ir al basurero: ", mycont)


func _on_Node2D_last_breath():
	pass # Replace with function body.
