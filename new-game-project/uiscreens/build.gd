extends CanvasLayer
# obrazek, name, cena
var data = [[load("res://icon.svg"), "shanty", 50],
[load("res://icon.svg"), "powerhouse", 100],
[load("res://icon.svg"), "water pump", 150],
[load("res://icon.svg"), "food supply", 250],
[load("res://icon.svg"), "factory", 450],
[load("res://icon.svg"), "street", 30],
[load("res://icon.svg"), "plant", 10]]
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
		pass
		#selected -= 4
	if input == "d":
		pass
		#selected += 4
	if input == "enter":
		pass
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
	for n in $TextureRect/GridContainer.get_children():
		if n.get_index() == selected:
			n.selected=true
		else:
			n.selected=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$TextureRect/moneycounter.text = "$"+ "%06d" % Global.money
