extends Node2D

var is_hard_mode = false

var cat_food = Resources.food
var cat_health = Resources.health
var timer2 = ResourcesT.timer2
var timer = ResourcesT.timer


var next_scene = "res://GameOver.tscn"  # La ruta a la siguiente escena
onready var sprite = get_node("FInalFood")
onready var tween = get_node("Tween")

onready var food_bar = get_node("GUI/TextureProgress2")
onready var health_bar = get_node("GUI/TextureProgress")


onready var PianoMusic = get_node("PianoMusic")
onready var CitySound = get_node("CitySound")
onready var BadMusic = get_node("BadMusic")

signal last_breath

signal death
var death_scene = preload("res://finals.tscn")
var timerDie = Timer.new()  # Crea un nuevo temporizador


func _ready():
	if(Global.difficulty == "hard"):
		print_debug("La dificultad es dificil")
		is_hard_mode = true
	timerDie.wait_time = 5  # Establece el tiempo de espera a 5 segundos
	timerDie.one_shot = true  # Establece el temporizador para que se ejecute una sola vez
	timerDie.connect("timeout", self, "_on_TimerDie_timeout")  # Conecta la señal "timeout" del 
	add_child(timerDie)  # Añade el temporizador como hijo de este nodo
	PianoMusic.play()
	CitySound.play()
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer2.connect("timeout", self, "_on_Timer_timeout2")
	timer.start()



func update_food_bar():
	food_bar.value = cat_food
	

func update_health_bar():
	health_bar.value = cat_health

func take_damage(amount, source):
	Global.status = source
	if is_hard_mode:
		amount += 10
	cat_health -= amount
	if(cat_health <= 0):
		cat_health = 0
	elif(cat_health >= 100):
		cat_health = 100
	update_health_bar()
	if(cat_health <= 15):
		BadMusic.play()
		PianoMusic.stop()
		CitySound.stop()
		print_debug("mycathealth", cat_health)
		get_node("Gato/Camera2D").shake(5)
		$Settings/CanvasModulate2.show()
		timer.stop()
		timer2.stop()
		timerDie.start()
		emit_signal("last_breath")
			
			

func _on_TimerDie_timeout():
	print_debug("health:", cat_health)
	get_tree().change_scene("res://finals.tscn")
	print_debug("¡Han pasado 5 segundos!")

				
func _input(event):
	if(sprite.visible == true):
		if event.is_action_pressed("ui_select"):
			# Si se presiona la tecla "space", inicia la animación de fundido y cambia la escena
			fade_out()
			yield(tween, "tween_completed")
			get_tree().change_scene_to(next_scene)

func take_food(amount):
	if is_hard_mode:
		amount -= 5
		if amount <= 0:
			amount = 5
	cat_food += amount
	if(cat_food > 100):
		cat_food = 100
	elif(cat_food <= 0):
		cat_food = 0
	update_food_bar()
	if(timer2.is_stopped() == false):
		timer2.stop()
		timer.start()


func less_food(amount):
	if is_hard_mode:
		amount += 5
		if amount <= 0:
			amount = 5
	cat_food -= amount
	if(cat_food <= 0):
		cat_food = 0
	elif(cat_food >= 100):
		cat_food = 100
	update_food_bar()

func _on_Timer_timeout():
	less_food(2)
	if(cat_food <= 0):
		timer.stop()
		timer2.start()
	elif(cat_food > 0 and timer2.is_stopped() == false):
		timer2.stop()

func _on_Timer_timeout2():
	take_damage(10,"veneno")
	update_health_bar()


func _on_Node2D_last_breath():
	var npcs = get_tree().get_nodes_in_group("NPCs")
	for npc in npcs:
		npc.get_node("AnimationPlayer").play("DarkWalk")
		
func fade_in():
	sprite.modulate = Color(1, 1, 1, 0)
	tween.interpolate_property(sprite, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 2.0, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()

func fade_out():
	tween.interpolate_property(sprite, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 2.0, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()


func _on_Panadero_gave_food(amount):
	take_food(amount)

func _on_Panadero_punched(amount):
	take_damage(amount,"hit")

func _on_Panadero2_gave_food(amount):
	take_food(amount)

func _on_Panadero2_punched(amount):
	take_damage(amount,"hit")


func _on_Trash_gave_food(amount):
	take_food(amount)

func _on_Trash_punched(amount):
	take_damage(amount,"hit")


func _on_Mujer_gave_food(amount):
	take_food(amount)


func _on_Mujer_punched(amount):
	take_damage(amount,"hit")


func _on_Viejo_gave_food(amount):
	take_food(amount)


func _on_Viejo_punched(amount):
	take_damage(amount,"hit")


func _on_Sombrero_gave_food(amount):
	take_food(amount)


func _on_Sombrero_punched(amount):
	take_damage(amount,"hit")


func _on_Small_trash_gave_food(amount):
	take_food(amount)


func _on_Small_trash_punched(amount):
	take_damage(amount,"hit")


func _on_Panadero3_gave_food(amount):
	take_food(amount)


func _on_Panadero3_punched(amount):
	take_damage(amount,"hit")


func _on_Panadero4_gave_food(amount):
	take_food(amount)


func _on_Panadero4_punched(amount):
	take_damage(amount,"hit")


func _on_Panadero5_gave_food(amount):
	take_food(amount)


func _on_Panadero5_punched(amount):
	take_damage(amount,"hit")


func _on_Mujer2_gave_food(amount):
	take_food(amount)


func _on_Mujer2_punched(amount):
	take_damage(amount,"hit")


func _on_Mujer3_gave_food(amount):
	take_food(amount)


func _on_Mujer3_punched(amount):
	take_damage(amount,"hit")


func _on_Mujer4_gave_food(amount):
	take_food(amount)


func _on_Mujer4_punched(amount):
	take_damage(amount,"hit")


func _on_Mujer5_gave_food(amount):
	take_food(amount)


func _on_Mujer5_punched(amount):
	take_damage(amount,"hit")


func _on_Viejo2_gave_food(amount):
	take_food(amount)


func _on_Viejo2_punched(amount):
	take_damage(amount,"hit")


func _on_Viejo3_gave_food(amount):
	take_food(amount)


func _on_Viejo3_punched(amount):
	take_damage(amount,"hit")


func _on_Viejo4_gave_food(amount):
	take_food(amount)


func _on_Viejo4_punched(amount):
	take_damage(amount,"hit")


func _on_Viejo5_gave_food(amount):
	take_food(amount)


func _on_Viejo5_punched(amount):
	take_damage(amount,"hit")


func _on_Sombrero2_gave_food(amount):
	take_food(amount)


func _on_Sombrero2_punched(amount):
	take_damage(amount,"hit")


func _on_Sombrero3_gave_food(amount):
	take_food(amount)


func _on_Sombrero3_punched(amount):
	take_damage(amount,"hit")


func _on_Sombrero4_gave_food(amount):
	take_food(amount)


func _on_Sombrero4_punched(amount):
	take_damage(amount,"hit")


func _on_Sombrero5_gave_food(amount):
	take_food(amount)


func _on_Sombrero5_punched(amount):
	take_damage(amount,"hit")


func _on_Trash2_gave_food(amount):
	take_food(amount)


func _on_Trash2_punched(amount):
	take_damage(amount,"hit")


func _on_Trash3_gave_food(amount):
	take_food(amount)


func _on_Trash3_punched(amount):
	take_damage(amount,"hit")


func _on_Trash4_gave_food(amount):
	take_food(amount)


func _on_Trash4_punched(amount):
	take_damage(amount,"hit")


func _on_Small_trash2_gave_food(amount):
	take_food(amount)


func _on_Small_trash2_punched(amount):
	take_damage(amount,"hit")


func _on_Small_trash3_gave_food(amount):
	take_food(amount)


func _on_Small_trash3_punched(amount):
	take_damage(amount,"hit")


func _on_Small_trash4_gave_food(amount):
	take_food(amount)


func _on_Small_trash4_punched(amount):
	take_damage(amount,"hit")


func _on_middle_Trash_gave_food(amount):
	take_food(amount)


func _on_middle_Trash_punched(amount):
	take_damage(amount,"hit")


func _on_middle_Trash2_gave_food(amount):
	take_food(amount)


func _on_middle_Trash2_punched(amount):
	take_damage(amount,"hit")


func _on_middle_Trash3_gave_food(amount):
	take_food(amount)


func _on_middle_Trash3_punched(amount):
	take_damage(amount,"hit")


func _on_middle_Trash4_gave_food(amount):
	take_food(amount)


func _on_middle_Trash4_punched(amount):
	take_damage(amount,"hit")
