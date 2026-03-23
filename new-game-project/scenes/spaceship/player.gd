extends Node3D
@onready var camera = $Camera3D
var look_dir: Vector2
var camera_sens = 5
var mouse_captured = false
var move= false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	mouse_captured = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	#print(camera.rotation_degrees.y)
	if Input.is_action_just_pressed("space"):
		move=true
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if Input.is_action_just_released("space"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		move=false
	
func _rotate_camera(sens_mod: float = 1.0) -> void:
	camera.rotation.y -= look_dir.x * camera_sens * sens_mod
	camera.rotation.x = clamp(camera.rotation.x - look_dir.y * camera_sens * sens_mod, -1.5, 1.5)
	camera.rotation_degrees.y = clamp(camera.rotation_degrees.y, -90.0, 90.0)
	

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if move == true:
			look_dir = event.relative * 0.001
			if mouse_captured: _rotate_camera()
	
