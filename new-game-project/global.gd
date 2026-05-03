extends Node
var money = 9999
var selectbuild = [["",1], Rect2(0,0,0,0), null, 0]
var power = 0 # cap 300 
var water = 0 # cap 300
var food = 0 # cap 300
var poorhap = 0 
var richhap = 0
var clock = {"hour": 0, "minute": 0}
var day = 1
var newday = true #tells u if there is a new day
var maxdays = 14 # po ilu dnach konie gry humpataputhumpataput wiooo wioooooo
var firstopening = true
func changescene(scene, trans):
	print("o")
	if get_parent().has_node("Scenemanager"):
		get_parent().get_node("Scenemanager").changescene(scene,trans)
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(_delta):
	clock.minute+= 1.0/12.0
	if clock["minute"] >= 60:
		clock["minute"] = 0
		clock["hour"] += 1
	if clock["hour"] >= 24:
		newday = true
		clock["hour"] = 0
		day += 1

	
