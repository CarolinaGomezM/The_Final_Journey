extends KinematicBody2D

var body_in_area = null

var health = Resources.health
var max_health = 100

var speed = 30
var direction = 1
var gravity = 0
var cont = 0;
var myfood = Resources.food
var maxfood = 3
var timer2 = ResourcesT.timer2
var timer = ResourcesT.timer  # Crea un nuevo Timer

func take_damage(amount):
	health -= amount
	update_health_bar()

func take_food(amount):
	myfood += amount
	if(myfood > 100):
		myfood = 100
		print_debug("Myfood:",myfood)
	update_food_bar()
	if(myfood > 0 and timer2.is_stopped() == false):
		print_debug("Se me acabó la comida 2")
		timer2.stop()
	timer.start()  # Reinicia el timer cuando el usuario come

func less_food(amount):
	if(myfood <= 0):
		myfood = 0
	myfood -=(amount)
	update_food_bar()
	
	
func update_food_bar():
	var food_bar = get_parent().get_node("Perro").get_node("Camera2D").get_node("TextureProgress2") 
	food_bar.value = myfood
	

func update_health_bar():
	var health_bar = get_parent().get_node("Perro").get_node("Camera2D").get_node("TextureProgress") 
	health_bar.value = health

# Called when the node enters the scene tree for the first time.
func _ready():
	timer2.connect("timeout", self, "_on_Timer_timeout2")
	randomize_direction()
	timer.connect("timeout", self, "_on_Timer_timeout")  # Conecta la señal "timeout" a una función en este script
	timer.start()  # Inicia el Timer

func _on_Timer_timeout():
	less_food(20)
	print_debug(myfood)
	if(myfood <= 0):
		timer.stop()
		timer2.start()
	elif(myfood > 0 and timer2.is_stopped() == false):
		myfood = 0
		print_debug("entre")
		print_debug("food:",myfood)
		timer2.start()


func _process(delta):
	var velocity = Vector2(speed * direction, 0)
	velocity.y += gravity * delta
	move_and_slide(velocity, Vector2.UP)

		
		
	if body_in_area and body_in_area.name == "Perro" and Input.is_action_just_pressed("Interaction"):
		print("¡He detectado a Perro!")
		cont += 1
		if(cont == 3):
			var accion = randi() %100 + 1
			print_debug(accion)
			cont = 0
			if(accion <= 40):
				var numero_aleatorio = randi() % 40 + 1
				print_debug(numero_aleatorio)
				take_damage(numero_aleatorio)
			else:
				maxfood -= 1
				#if(maxfood > 0):
				var food = randi() % 35 + 1
				print_debug("La comida es:",food)
				take_food(food)
				#else:
					#print_debug("Ya fue mucha comida")

func _on_Area2D_body_entered(body):
	body_in_area = body
	if body.name == "Perro" and body_in_area == body:
		yield(get_tree().create_timer(.3), "timeout")
		var sprite = get_node("AnimatedSprite") 
		sprite.show()
		#sprite.play("nombre_de_tu_animacion")  # Cambia "nombre_de_tu_animacion" al nombre de la animación que quieres reproducir
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	if body ==  body_in_area:
		var sprite = get_node("AnimatedSprite")
		sprite.hide()
		body_in_area = null
	pass # Replace with function body.

func randomize_direction():
	if rand_range(-1, 1) > 0:
		direction = 1
	else:
		direction = -1
	yield(get_tree().create_timer(rand_range(2, 5)), "timeout")
	randomize_direction()

func _on_Timer_timeout2():
	health -= 20
	var health_bar = get_parent().get_node("Perro").get_node("Camera2D").get_node("TextureProgress") 
	health_bar.value = health
	print(health)  # Imprime la cantidad actual de vida (puedes actualizar tu barra de vida aquí)
