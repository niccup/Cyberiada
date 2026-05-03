extends CSGBox3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var rand = randf_range(0.5,1.0)
	$Label3D.modulate = Color(rand, 0, 0, 1.0)
	$Label3D.text = str(Global.clock["hour"]).pad_zeros(2) + ":" + str(int(Global.clock["minute"])).pad_zeros(2)
