extends Node2D

var subtitles = [{"time": 1, "subtitle": "Give me your phone"}, {"time": 2, "subtitle": "What?"}, {"time": 3, "subtitle": "Give me yout fucking phone right now"}, {"time": 5, "subtitle": "I wont give you anything"}, {"time": 7, "subtitle": "You lied!"}, {"time": 8, "subtitle": "I didn't lie"}, {"time": 9, "subtitle": "You actually lied"}, {"time": 10, "subtitle": "No, what are you talking about?"}, {"time":12, "subtitle": "You cheated on me..."}, {"time": 13, "subtitle": "No, I didn't cheat"}, {"time": 15, "subtitle": "..."},{"time": 16.5, "subtitle": "Get out of my house"}, {"time": 18, "subtitle": "No, I-"}, {"time": 19, "subtitle": "GET OUT OF MY FUCKING HOUSE AND PICK YOUR FUCKING CAT TOO"}, {"time": 23, "subtitle": "You now what? I'll leave"}, {"time": 24.7, "subtitle": "..because you are CRAZY!"},{"time": 27.1, "subtitle": "I am not crazy"}, {"time": 28.3, "subtitle": "Yes you are!"}, {"time": 29, "subtitle": "I'll pack my things and I'll leave tomorrow morning"},{"time": 31, "subtitle": "Well, but pick your fucking cat too"}, {"time": 32.5, "subtitle": "I don't want that cat"}, {"time": 34, "subtitle": "Why not? IT'S YOURS!"}, {"time": 35.4, "subtitle": "It is old and look at him is ugly..."},{"time": 37.5, "subtitle": "..."},{"time": 39, "subtitle": "Well, I don't know what you want to do with that cat, but pick it with you!"}, {"time": 42.5, "subtitle": "You know what? I'll leave him in the streets..."},{"time": 44.3, "subtitle": "Do whatever you want!"}]  # Asegúrate de cambiar esto a tus subtítulos y sus tiempos
var current_subtitle = 0
var tween = Tween.new()



func _ready():
	var label = get_node("Label")
	label.autowrap = true
	label.rect_min_size = Vector2(150, 50)  
	add_child(tween)
	tween.interpolate_method(self, "set_subtitle_time", 0, subtitles.back()["time"], subtitles.back()["time"], Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.connect("tween_all_completed", self, "_on_Tween_tween_all_completed")
	tween.start()

	var audio = AudioStreamPlayer.new()  # Crea un nuevo AudioStreamPlayer
	audio.stream = load("res://Assets/audios/fight.ogg")  # Asegúrate de cambiar esto a la ruta de tu archivo de audio
	add_child(audio)
	audio.play()

func set_subtitle_time(time):
	update_subtitle(time)

func update_subtitle(time):  # Asegúrate de cambiar esto a la ruta correcta de tu nodo Label
	var label = get_node("Label")
	for i in range(subtitles.size()):
		if subtitles[i]["time"] > time:
			break
		label.text = subtitles[i]["subtitle"]

func _on_Tween_tween_all_completed():
	print_debug("acabo de mujerrrrrr")
	get_tree().change_scene("res://historia1.tscn")  # Cambia esto a la ruta de la escena a la que quieres ir después
