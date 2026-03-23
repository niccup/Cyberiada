extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("uid://ovu6xg3i6fm5")


func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("uid://ce7pkv4epp1tm")


func _on_settings_pressed() -> void:
	print("OPT DZIALA")
	# gustaw tu ma byc jakas inna scena na settingsy?


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()
