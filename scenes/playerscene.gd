
extends RigidBody3D

@export var camera: Camera3D

var mouse_click: Vector2
var mouse_release: Vector2
var mouse_direction: Vector2

var ballforce: Vector3
var maxdrag: float = 100
var maxforce: float = 50


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			mouse_click = event.position
		else:
			mouse_release = event.position
			mouse_direction = mouse_release - mouse_click
			
			var balldirection = Vector3(
				camera.global_basis.x * -mouse_direction.x
				+ camera.global_basis.z * -mouse_direction.y).normalized()
			
			var percentage = mouse_direction.length() / maxdrag
			percentage = min(percentage, 4)
			ballforce = balldirection*(percentage*maxforce)
			apply_central_force(ballforce)
