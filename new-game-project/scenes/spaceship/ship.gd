extends Node3D
@onready var camera = $player/Camera3D
var raycast_result = null
var scene = "city"
var finishkapsulkidozmywarki = false
# Called when the node enters the scene tree for the first time.


func change_scene(scenee):
	var screen = $mainscreen
	if scenee == "city":
		screen.get_node("City").show()
		screen.get_node("Build").hide()
		scene= "city"
	if scenee == "build":
		screen.get_node("City").hide()
		screen.get_node("Build").show()
		scene= "build"
		
	
func ray():
	
	var screen = $mainscreen
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_length = 100
	var from = camera.project_ray_origin(mouse_pos)
	var to = from + camera.project_ray_normal(mouse_pos) * ray_length
	var space = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.from = from
	ray_query.to = to
	ray_query.collide_with_areas = true
	raycast_result = space.intersect_ray(ray_query)
	if raycast_result.has("collider"):
		if raycast_result["collider"].is_in_group("button"):
			raycast_result["collider"].get_node("AnimationPlayer").play("press")
		if (raycast_result["collider"].name) == "btn_build":

			for n in screen.get_children():
				n.hide()
			change_scene("build")
		if (raycast_result["collider"].name) == "btn_back":
			
			for n in screen.get_children():
				n.hide()
			change_scene("city")
		
		
		if (raycast_result["collider"].name) == "btn_left":
			if scene == "build":
				screen.get_node("Build").addinput("l")
			if scene == "city":
				screen.get_node("City").addinput("l")
		if (raycast_result["collider"].name) == "btn_right":
			if scene == "build":
				screen.get_node("Build").addinput("r")
			if scene == "city":
				screen.get_node("City").addinput("r")
		if (raycast_result["collider"].name) == "btn_up":
			if scene == "build":
				screen.get_node("Build").addinput("u")
			if scene == "city":
				screen.get_node("City").addinput("u")
		if (raycast_result["collider"].name) == "btn_down":
			if scene == "build":
				screen.get_node("Build").addinput("d")
			if scene == "city":
				screen.get_node("City").addinput("d")
		if (raycast_result["collider"].name) == "btn_enter":
			if scene == "build":
				screen.get_node("Build").addinput("enter")
				screen.get_node("City").tset=false
			if scene == "city":
				screen.get_node("City").addinput("enter")
		if (raycast_result["collider"].name) == "btn_destroy":
			if scene == "city":
				screen.get_node("City").addinput("destroy")
		if (raycast_result["collider"].name) == "btn_back":
			if scene == "city":
				screen.get_node("City").addinput("back")
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index==1:
			if event.pressed:
				ray()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.newday==true:
		$dayui.show()
		print("OHH YEAH")
		if Global.firstopening == true:
			
			$dayui/AnimationPlayer.play("new_animation_2")
			Global.firstopening=false
		else:
			$dayui/AnimationPlayer.play("new_animation")
		Global.newday=false
		$dayui/Label.text = "Dzień " + str(Global.day)
	if Global.day==15:
		if finishkapsulkidozmywarki == false:
			Global.changescene("res://scenes/endingz/ending.tscn",2)
			finishkapsulkidozmywarki = true
