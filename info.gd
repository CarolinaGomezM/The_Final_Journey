extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var status = false

func _on_Info_Button_pressed():
		if($Mybook.visible == false and $Mybook2.visible == false):
			$infobutton.play()
			$Mybook.show()
			$Label.show()
			$Controls.show()
			$izq.show()
			$der.show()
			$Arrow_next.show()
			$Label3.show()
			$INTE.show()
			$AnimatedSprite.show()
			$Label2.show()
			$Controls2.show()
			$Label4.show()
			$Button_exit.show()
		elif $Mybook.visible == true:
			$close.play()
			$Mybook.hide()
			$Label.hide()
			$Controls.hide()
			$izq.hide()
			$der.hide()
			$Arrow_next.hide()
			$Label3.hide()
			$INTE.hide()
			$AnimatedSprite.hide()
			$Label2.hide()
			$Controls2.hide()
			$Label4.hide()
			$Button_exit.hide()
			
		elif($Mybook2.visible == true):
			$close.play()
			$Mybook2.hide()
			$Label5.hide()
			$Controls5.hide()
			$Label6.hide()
			$AnimatedSprite2.hide()
			$Controls6.hide()
			$AnimatedSprite3.hide()
			$AnimatedSprite4.hide()
			$Button_last.hide()
			$Button_close.hide()


func _on_Button_exit_pressed():
			$close.play()
			$Mybook.hide()
			$Label.hide()
			$Controls.hide()
			$izq.hide()
			$der.hide()
			$Arrow_next.hide()
			$Label3.hide()
			$INTE.hide()
			$AnimatedSprite.hide()
			$Label2.hide()
			$Controls2.hide()
			$Label4.hide()
			$Button_exit.hide()


func _on_Arrow_next_pressed():
			$next_page.play()
			$Mybook.hide()
			$Label.hide()
			$Controls.hide()
			$izq.hide()
			$der.hide()
			$Arrow_next.hide()
			$Label3.hide()
			$INTE.hide()
			$AnimatedSprite.hide()
			$Label2.hide()
			$Controls2.hide()
			$Label4.hide()
			$Button_exit.hide()
			$Mybook2.show()
			$Label5.show()
			$Controls5.show()
			$Label6.show()
			$AnimatedSprite2.show()
			$Controls6.show()
			$AnimatedSprite3.show()
			$AnimatedSprite4.show()
			$Button_last.show()
			$Button_close.show()


func _on_Button_last_pressed():
			$next_page.play()
			$Mybook.show()
			$Label.show()
			$Controls.show()
			$izq.show()
			$der.show()
			$Arrow_next.show()
			$Label3.show()
			$INTE.show()
			$AnimatedSprite.show()
			$Label2.show()
			$Controls2.show()
			$Label4.show()
			$Button_exit.show()
			$Mybook2.hide()
			$Label5.hide()
			$Controls5.hide()
			$Label6.hide()
			$AnimatedSprite2.hide()
			$Controls6.hide()
			$AnimatedSprite3.hide()
			$AnimatedSprite4.hide()
			$Button_last.hide()
			$Button_close.hide()


func _on_Button_close_pressed():
			$close.play()
			$Mybook2.hide()
			$Label5.hide()
			$Controls5.hide()
			$Label6.hide()
			$AnimatedSprite2.hide()
			$Controls6.hide()
			$AnimatedSprite3.hide()
			$AnimatedSprite4.hide()
			$Button_last.hide()
			$Button_close.hide()





