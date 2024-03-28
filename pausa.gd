extends Control

var is_paused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("esc"):
		$resume_button.show()
		$Controls_Button.show()
		$MainMenu_BUTTON.show()
		$Sprite.hide()
		$Options.hide()
		$Controls.hide()
		$Label2.hide()
		$izq.hide()
		$der.hide()
		$Label3.hide()
		$INTE.hide()
		$Arrow_exit.hide()

		self.is_paused = !is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
	

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.hide()
	$Options.hide()
	$Controls.hide()
	$Label2.hide()
	$izq.hide()
	$der.hide()
	$Label3.hide()
	$INTE.hide()
	$Arrow_exit.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Controls_Button_pressed():
	$resume_button.hide()
	$Controls_Button.hide()
	$MainMenu_BUTTON.hide()
	$Sprite.hide()
	$Options.hide()
	$Controls.hide()
	$Label2.hide()
	$izq.hide()
	$der.hide()
	$Label3.hide()
	$INTE.hide()
	$Arrow_exit.hide()
	$Sprite.show()
	$Options.show()
	$Controls.show()
	$Label2.show()
	$izq.show()
	$der.show()
	$Label3.show()
	$INTE.show()
	$Arrow_exit.show()


func _on_Arrow_exit_pressed():
	$resume_button.show()
	$Controls_Button.show()
	$MainMenu_BUTTON.show()
	$Sprite.hide()
	$Options.hide()
	$Controls.hide()
	$Label2.hide()
	$izq.hide()
	$der.hide()
	$Label3.hide()
	$INTE.hide()
	$Arrow_exit.hide()


func _on_MainMenu_BUTTON_pressed():
	self.is_paused = !is_paused
	get_tree().change_scene("res://Menu.tscn")


func _on_resume_button_pressed():
	self.is_paused = !is_paused


func _on_resume_button_mouse_entered():
	$audio.play()


func _on_Controls_Button_mouse_entered():
	$audio.play()


func _on_MainMenu_BUTTON_mouse_entered():
	$audio.play()


func _on_Arrow_exit_mouse_entered():
	$audio.play()
