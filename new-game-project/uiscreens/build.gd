extends CanvasLayer
# obrazek, name, cena
var data = [[load("res://icon.svg"), "shanty", 2137],
[load("res://icon.svg"), "powerhouse", 2435],
[load("res://icon.svg"), "water pump", 3443],
[load("res://icon.svg"), "food supply", 6767],
[load("res://icon.svg"), "factory", 3567],
[load("res://icon.svg"), "street", 500],
[load("res://icon.svg"), "plant", 100]]
var selected = 0

var panel = load("uid://bvxthgic28ya5")
# Called when the node enters the scene tree for the first time.


func addinput(input):
	print(input)
	var prevsel = selected
	if input == "l":
		selected -= 1
	if input == "r":
		selected += 1
	if input == "u":
		selected -= 4
	if input == "d":
		selected += 4
	if selected < 0:
		selected = prevsel
	if selected > 6:
		selected = prevsel
	for n in $TextureRect/GridContainer.get_children():
		if n.get_index() == selected:
			n.selected=true
		else:
			n.selected=false
	
func _ready() -> void:
	for n in data:
		print()
		var inst = panel.instantiate()
		inst.icon = n[0]
		inst.labelname = n[1]
		inst.price = n[2]
		
		$TextureRect/GridContainer.add_child(inst)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
