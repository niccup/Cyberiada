extends ColorRect
var texture = null
var selected = false
var labelname = ""
var price = 0
var icon = null
var region := Rect2(0,0,0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(region)
	
	print(icon)
	$icon.texture = AtlasTexture.new()
	$icon.texture.atlas = (icon)
	$icon.texture.region = region
	$name.text = labelname
	$price.text = str(price)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if selected == true:
		$sel_high.show()
		$Label3.hide()
		
	else:
		$sel_high.hide()
		$Label3.show()
