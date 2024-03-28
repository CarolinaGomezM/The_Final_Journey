extends Node2D



var timer = Timer.new()
var timer2 = Timer.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(timer2)
	timer2.wait_time = 3
	timer2.one_shot = false

	timer.wait_time = 3  # Establece el tiempo de espera a 60 segundos (1 minuto)
	timer.one_shot = false  # Asegúrate de que el Timer se repita
	add_child(timer)  # Añade el Timer a la escena
	timer.start()  # Inicia el Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
