extends CanvasLayer
var pause = false
@onready var world = get_parent().get_node("WorldEnvironment")
var settings = {}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	get_text("windowmode")
	get_text("strechmode")
	get_text("aspect")
	%resx.value = (get_tree().root.content_scale_size.x)
	%resy.value = (get_tree().root.content_scale_size.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("pause"):
		if pause == false:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			get_tree().paused = true
			world.environment.adjustment_saturation = 0
			show()
			pause=true
			return
	if Input.is_action_just_pressed("pause"):
		if pause == true:
			get_tree().paused = false
			world.environment.adjustment_saturation = 1
			hide()
			pause=false


func _on_back_pressed() -> void:
	get_tree().paused = false
	world.environment.adjustment_saturation = 1
	hide()
	pause=false


func _on_settings_pressed() -> void:
	$settings.show()
	$pause.hide()
	var e =FileAccess.open("user://save/settings", FileAccess.READ)
	settings= e.get_var()
	print(settings)
	%winodwmode.value= settings["windowmode"]
	%windowstrechmode.value= settings["strechmode"]
	%windowaspect.value = settings["aspectmode"]
	%resx.value = settings["resolution"].x
	%resy.value = settings["resolution"].y

	%ssrtoggle.button_pressed = settings["SSR"]
	%ssaotoggle.button_pressed = settings["SSAO"]
	%ssiltoggle.button_pressed = settings["SSIL"]
	%sdfgitoggle.button_pressed = settings["SDFGI"]
	e.close()

func get_text(mode):
	match mode:
		"windowmode":
		
			var mode_names = {
			DisplayServer.WINDOW_MODE_WINDOWED: "Windowed",
			DisplayServer.WINDOW_MODE_MINIMIZED: "Minimized",
			DisplayServer.WINDOW_MODE_MAXIMIZED: "Maximized",
			DisplayServer.WINDOW_MODE_FULLSCREEN: "Fullscreen",
			DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN: "Excl. Fullscreen"
			}
			%windowmodelabel.text=mode_names.get(DisplayServer.window_get_mode(), "uknkown")
		"strechmode":
			var stretch_names = {
			Window.CONTENT_SCALE_MODE_DISABLED: "Disabled",
			Window.CONTENT_SCALE_MODE_CANVAS_ITEMS: "Canvas Item",
			Window.CONTENT_SCALE_MODE_VIEWPORT: "Viewport"
			}
			%windowstrechmodelabel.text=stretch_names.get(get_tree().root.content_scale_mode, "uknkown")
			
		"aspect":
			var aspect_names = {
			Window.CONTENT_SCALE_ASPECT_IGNORE: "Stretch",
			Window.CONTENT_SCALE_ASPECT_KEEP: "Keep",
			# USUN PATODEWELOPERKE Z SERWERA PLs
			Window.CONTENT_SCALE_ASPECT_KEEP_WIDTH: "Keep Width",
			Window.CONTENT_SCALE_ASPECT_KEEP_HEIGHT: "Keep Height",
			Window.CONTENT_SCALE_ASPECT_EXPAND: "Expand"
			}
			%windowaspectlabel.text = aspect_names.get(get_tree().root.content_scale_aspect, "unknown")
	


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_ssrtoggle_toggled(toggled_on: bool) -> void:
	world.environment.ssr_enabled = toggled_on


func _on_ssaotoggle_toggled(toggled_on: bool) -> void:
	world.environment.ssao_enabled = toggled_on


func _on_ssiltoggle_toggled(toggled_on: bool) -> void:
	world.environment.ssil_enabled = toggled_on


func _on_sdfgitoggle_toggled(toggled_on: bool) -> void:
	world.environment.sdfgi_enabled = toggled_on


func _on_backsettings_pressed() -> void:
	$settings.hide()
	$pause.show()
	var e =FileAccess.open("user://save/settings", FileAccess.READ)
	var settings = e.get_var()
	settings["windowmode"] = %winodwmode.value
	settings["strechmode"] = %windowstrechmode.value
	settings["aspectmode"] = %windowaspect.value
	settings["resolution"] = Vector2(%resx.value, %resy.value)
	settings["SSR"] = %ssrtoggle.button_pressed
	settings["SSAO"] = %ssaotoggle.button_pressed
	settings["SSIL"] = %ssiltoggle.button_pressed
	settings["SDFGI"] = %sdfgitoggle.button_pressed
	print(settings)
	e.close()
	e = FileAccess.open("user://save/settings", FileAccess.WRITE)
	e.store_var(settings)
	e.close()
	
	
func _on_winodwmode_drag_ended(value_changed: bool) -> void:
	DisplayServer.window_set_mode(int(%winodwmode.value))
	get_text("windowmode")


func _on_windowstrechmode_drag_ended(value_changed: bool) -> void:
	
	get_tree().root.content_scale_mode = int( %windowstrechmode.value )
	get_text("strechmode")


func _on_windowaspect_drag_ended(value_changed: bool) -> void:
	get_tree().root.content_scale_aspect = int(%windowaspect.value)
	get_text("aspect")


func _on_resx_value_changed(value: float) -> void:
	get_tree().root.content_scale_size.x=%resx.value
	#DisplayServer.window_set_size(Vector2(%resx.value, %resy.value))

# pozdrawiam

func _on_resy_value_changed(value: float) -> void:
	get_tree().root.content_scale_size.y=%resy.value
	#DisplayServer.window_set_size(Vector2(%resx.value, %resy.value))
