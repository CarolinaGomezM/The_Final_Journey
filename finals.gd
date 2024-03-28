extends Node2D

var fade_duration : float = 4  # Duración de la animación de fundido
var next_scene_path : String = "res://GameOver.tscn"  # Ruta de la siguiente escena
var sprite : Sprite

func _ready():
	$Song.play()
	print_debug(Global.status)
	if Global.status == "veneno":
		$Veneno.show()
		sprite = $Veneno
		$Label.text = "Cause of death: desnutrition."
		sprite.modulate.a = 0.0  # Configura la opacidad a 0 al principio
	else:
		$Hit.show()
		sprite = $Hit
		$Label.text = "Cause of death: animal abuse"
		sprite.modulate.a = 0.0  # Configura la opacidad a 0 al principio
		
	$Tween.interpolate_property(sprite, "modulate:a", 0.0, 1.0, fade_duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		start_fade_out()

func start_fade_out():
	$Tween.interpolate_property(sprite, "modulate:a", 1.0, 0.0, fade_duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")
	change_scene()

func change_scene():
	$AnimatedSprite2.hide()
	$AnimatedSprite.show()
	$Label2.show()
	$Button.show()

func _on_Button_pressed():
	get_tree().change_scene("res://Menu.tscn")


func _on_Button_mouse_entered():
	$audo_button.play()
