extends Node2D

var images = ["res://Assets/history/1/1.jpeg", "res://Assets/history/1/2.jpeg", "res://Assets/history/1/3.jpeg", "res://Assets/history/1/4.jpeg"]
var subtitles = [{"time": 1, "subtitle": "Give me your phone"}, {"time": 2, "subtitle": "What?"}, {"time": 3, "subtitle": "Give me yout fucking phone right now"}, {"time": 5, "subtitle": "I wont give you anything"}, {"time": 7, "subtitle": "You lied!"}, {"time": 8, "subtitle": "I didn't lie"}, {"time": 9, "subtitle": "You actually lied"}, {"time": 10, "subtitle": "No, what are you talking about?"}, {"time":12, "subtitle": "You cheated on me..."}, {"time": 13, "subtitle": "No, I didn't cheat"}, {"time": 15, "subtitle": "..."},{"time": 16.5, "subtitle": "Get out of my house"}, {"time": 18, "subtitle": "No, I-"}, {"time": 19, "subtitle": "GET OUT OF MY FUCKING HOUSE AND PICK YOUR FUCKING CAT TOO"}, {"time": 23, "subtitle": "You now what? I'll leave"}, {"time": 24.7, "subtitle": "..because you are CRAZY!"},{"time": 27.1, "subtitle": "I am not crazy"}, {"time": 28.3, "subtitle": "Yes you are!"}, {"time": 29, "subtitle": "I'll pack my things and I'll leave tomorrow morning"},{"time": 31, "subtitle": "Well, but pick your fucking cat too"}, {"time": 32.5, "subtitle": "I don't want that cat"}, {"time": 34, "subtitle": "Why not? IT'S YOURS!"}, {"time": 35.4, "subtitle": "It is old and look at him is ugly..."},{"time": 37.5, "subtitle": "..."},{"time": 39, "subtitle": "Well, I don't know what you want to do with that cat, but pick it with you!"}, {"time": 42.5, "subtitle": "You know what? I'll leave him in the streets..."},{"time": 44.3, "subtitle": "Do whatever you want!"}]  # Asegúrate de cambiar esto a tus subtítulos y sus tiempos
var current_image = 0
var current_subtitle = 0
var state = "images"
var tween = Tween.new()
var audio = AudioStreamPlayer.new()


func _ready():
	get_node("ColorRect2").hide()
	add_child(tween)
	add_child(audio)
	show_image()

func _input(event):
	if event.is_action_pressed("ui_select"):
		if state == "images":
			next_image()
		elif state == "subtitles":
			end_subtitles()
		elif state == "end":
			next_image()


func show_image():
	var sprite = get_node("Sprite")
	sprite.texture = load(images[current_image])
	sprite.modulate = Color(1, 1, 1, 0)
	tween.interpolate_property(sprite, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 2.0, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()

	if current_image == 1 and state != "subtitles":  # Comienza los subtítulos en la segunda imagen solo si no han comenzado ya
		$mysound1.stop()
		start_subtitles()
	elif current_image == 0:
		$mysound1.play()
	elif current_image == 2:
		$mysound2.play()
	elif current_image == 3:
		$mysound2.stop()
		$mysound3.play()
		

	

func next_image():
	current_image += 1
	if current_image < images.size():
		show_image()
	else:
		get_tree().change_scene("res://Mundo.tscn")

func start_subtitles():
	get_node("ColorRect2").show()
	state = "subtitles"
	var label = get_node("Label")
	label.autowrap = true
	label.rect_min_size = Vector2(150, 50)
	tween.interpolate_method(self, "set_subtitle_time", 0, subtitles.back()["time"], subtitles.back()["time"], Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.connect("tween_all_completed", self, "_on_Tween_tween_all_completed")
	tween.start()
	audio.stream = load("res://Assets/audios/fight.ogg")
	audio.play()

func set_subtitle_time(time):
	update_subtitle(time)

func update_subtitle(time):
	var label = get_node("Label")
	for i in range(subtitles.size()):
		if subtitles[i]["time"] > time:
			break
		label.text = subtitles[i]["subtitle"]

func _on_Tween_tween_all_completed():
	audio.stop()
	print_debug("acabo de mujerrrrrr")
#	get_tree().change_scene("res://historia1.tscn")

func end_subtitles():
	state = "end"
	get_node("ColorRect2").hide()
	audio.stop()  # Detiene el audio
	tween.stop_all()  # Detiene los subtítulos
	tween.disconnect("tween_all_completed", self, "_on_Tween_tween_all_completed")  # Desconecta la señal
	get_node("Label").text = ""  # Limpia los subtítulos
	get_node("Label").hide()
	next_image_after_subtitles()

func next_image_after_subtitles():
	current_image += 1
	if current_image < images.size():
		show_image()
	else:
		print_debug("No hay más imágenes después de los subtítulos.")
