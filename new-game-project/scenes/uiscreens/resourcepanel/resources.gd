extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	%foodbar.value = Global.food
	%waterbar.value = Global.water
	%elebar.value = Global.power
	%phapbar.value = Global.poorhap
	%rhapbar.value = Global.richhap
