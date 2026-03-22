extends Node3D
@onready var camera = $player/Camera3D
var raycast_result = null
var scene = "city"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	
	var savefolder = DirAccess.make_dir_absolute("user://save") 
	if FileAccess.file_exists("user://save/settings"):
		pass
	else:
		print("HOLAAA")
		var settingfile = FileAccess.open("user://save/settings", FileAccess.WRITE)
		settingfile.store_var({"windowmode": 3, "strechmode": 1, "aspectmode": 4, "resolution": Vector2(1152,648), "SSR": true, "SSAO": true, "SSIL": true, "SDFGI": true})
	var e =FileAccess.open("user://save/settings", FileAccess.READ)
	var settings = e.get_var()
	print(settings)
	DisplayServer.window_set_mode(settings["windowmode"])
	get_window().content_scale_size = (settings["resolution"])
	get_tree().root.content_scale_mode = int(settings["strechmode"] )
	get_tree().root.content_scale_aspect = int(settings["aspectmode"])
	var env = $WorldEnvironment.environment
	env.ssr_enabled = settings["SSR"]
	env.ssao_enabled = settings["SSAO"]
	env.ssil_enabled = settings["SSIL"]
	env.sdfgi_enabled = settings["SDFGI"]
	FileAccess.open("user://save/gamedata", FileAccess.WRITE)
	e.close()
	
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
			screen.get_node("Build").show()
			scene = "build"
		if (raycast_result["collider"].name) == "btn_back":
			
			for n in screen.get_children():
				n.hide()
			screen.get_node("City").show()
			scene = "city"
		
		
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
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index==1:
			if event.pressed:
				ray()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
