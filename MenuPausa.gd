extends Node

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("esc"):
		if $CanvasModulate.visible == true:
			$CanvasModulate.hide()
			$paper.hide()
			$Label.hide()
			$Control_BUTTON.hide()
			$MainMenu_BUTTON.hide()
			$resume_button.hide()
			$paused.hide()
			$controls.hide()
			$MM.hide()
			$Resume.hide()
			$Light2D.hide()
		else:
			$CanvasModulate.show()
			$paper.show()
			$Label.show()
			$Control_BUTTON.show()
			$MainMenu_BUTTON.show()
			$resume_button.show()
			$paused.show()
			$controls.show()
			$MM.show()
			$Resume.show()
			$Light2D.show()
		get_tree().paused = not get_tree().paused
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
