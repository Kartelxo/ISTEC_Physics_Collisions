extends RigidBody3D

var mouse_click: Vector2
var mouse_release: Vector2
var direcao: Vector2


func _input(event) -> void:
	if event is InputEventMouseButton:
		if event.pressed == true:
			print("click")
			print(event.position)
			mouse_click = event.position
		else:
			print("release")
			print(event.position)
			mouse_release = event.position
			direcao = mouse_release - mouse_click
			print (direcao)
	
