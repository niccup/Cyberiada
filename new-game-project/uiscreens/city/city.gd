extends Node2D
var cord = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func addinput(input):
	match input:
		"l":
			cord.x -=1
			cord.y +=1
		"r":
			cord.x +=1
			cord.y -=1
		"u":
			cord.y +=1
			cord.x +=1
		"d":
			cord.y -=1
			cord.x -=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(cord)
	$Camera2D.position.x = lerp($Camera2D.position.x, cord.x * 102.4/2, 0.1)
	$Camera2D.position.y = lerp($Camera2D.position.y, cord.y * -41/2, 0.1)
