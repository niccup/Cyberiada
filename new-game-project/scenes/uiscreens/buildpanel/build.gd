extends CanvasLayer
# obrazek, name, cena
var dataa = [[load("uid://f1sxgpqvydp6"), "wieżowiec", 50, Rect2(0,1024,1024,1024), ["tower", 1]],
[load("uid://f1sxgpqvydp6"), "elektrownia", 100, Rect2(2048,0,1024,1024), ["powerplant", 1]],
[load("uid://f1sxgpqvydp6"), "pompownia", 150, Rect2(0,0,1024,1024), ["waterpump", 1]],
[load("uid://f1sxgpqvydp6"), "jadłodajnia", 250, Rect2(0,2048,1024,1024), ["foodsupply", 1]],
[load("uid://f1sxgpqvydp6"), "biurowiec", 450, Rect2(0,3072,1024,1024), ["house", 1]],
[load("uid://c6shlb5oi2wep"), "ulica", 30, Rect2(0,0,1024,1024), ["street", 1]],
[load("uid://f1sxgpqvydp6"), "roślina", 10, Rect2(3072,0,1024,1024), ["plant", 1]]]
var selected = 0

var panel = load("uid://bvxthgic28ya5")
# Called when the node enters the scene tree for the first time.


func addinput(input):
	print(selected)
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
		print(selected)
		Global.selectbuild = [dataa[selected][4].duplicate(), dataa[selected][3], dataa[selected][0], dataa[selected][2]]
		print(dataa[selected])
		get_node("/root/ship").change_scene("city")

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
	for n in dataa:

		var inst = panel.instantiate()
		inst.icon = n[0]
		inst.labelname = n[1]
		inst.price = n[2]
		inst.region = n[3]
		
		$TextureRect/GridContainer.add_child(inst)
	for n in $TextureRect/GridContainer.get_children():
		if n.get_index() == selected:
			n.selected=true
		else:
			n.selected=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	$TextureRect/moneycounter.text = "$"+ "%06d" % Global.money
