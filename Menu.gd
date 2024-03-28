extends Control

var click_sound = load("res://Assets/Menu/AUDIOS/snap6.ogg")

# Carga el archivo de audio
var music = load("res://Assets/audios/Music/The Approaching Night by Philip Wesley http_philipwesley.com.mp3")

func _ready():
	print_debug($Label.text)
	$Label.show()
	$VBoxContainer.add_constant_override("separation", 6)
	$AnimatedSprite2.hide()
	$TileMap.hide()
	$Options.hide()
	$Controls.hide()
	$Label2.hide()
	$izq.hide()
	$der.hide()
	$Label3.hide()
	$INTE.hide()
	$Arrow_exit.hide()
	var player = get_node("AudioStreamPlayer2D")
	
	# Establece el audio a reproducir
	player.stream = music
	
	# Inicia la reproducción del audio
	player.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_Button_pressed():	
	$Level.show()
	$difficulty_label.show()
	$easy_mode.show()
	$hard_mode.show()
	$light_level.show()
	$TextureButton.show()
	$VBoxContainer.hide()


func _on_Start_Button_mouse_entered():
	$AudioStreamPlayer.play()


func _on_Opc_Button_mouse_entered():
	$AudioStreamPlayer.play()
	print_debug("Pase encima")

func _on_Opc_Button_pressed():
	print_debug("Entre")
	$VBoxContainer.hide()
	$AnimatedSprite.hide()
	$Label.hide()
	$Light2D.hide()
	$AnimatedSprite2.show()
	$TileMap.show()
	$Options.show()
	$Controls.show()
	$Label2.show()
	$izq.show()
	$der.show()
	$Label3.show()
	$INTE.show()
	$Arrow_exit.show()
	


func _on_Arrow_exit_mouse_entered():
	$AudioStreamPlayer.play()




func _on_Arrow_exit_pressed():
	$VBoxContainer.show()
	$AnimatedSprite.show()
	$Label.show()
	$Light2D.show()
	$AnimatedSprite2.hide()
	$TileMap.hide()
	$Options.hide()
	$Controls.hide()
	$Label2.hide()
	$izq.hide()
	$der.hide()
	$Label3.hide()
	$INTE.hide()
	$Arrow_exit.hide()


func _on_EXIT_mouse_entered():
	$AudioStreamPlayer.play()


func _on_EXIT_pressed():
	get_tree().quit()


func _on_easy_mode_pressed():
	get_tree().change_scene("res://historia1.tscn")


func _on_hard_mode_pressed():
	Global.difficulty = "hard"
	get_tree().change_scene("res://historia1.tscn")


func _on_TextureButton_pressed():
	$Level.hide()
	$difficulty_label.hide()
	$easy_mode.hide()
	$hard_mode.hide()
	$light_level.hide()
	$TextureButton.hide()
	$VBoxContainer.show()
