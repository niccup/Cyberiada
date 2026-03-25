extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$AcceptDialog.popup_centered()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	$clickaudio.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("uid://ovu6xg3i6fm5")

func _on_continue_pressed() -> void:
	$clickaudio.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("uid://ce7pkv4epp1tm")


func _on_settings_pressed() -> void:
	$clickaudio.play()
	await get_tree().create_timer(0.5).timeout
	print("OPT DZIALA")
	# gustaw tu ma byc jakas inna scena na settingsy?


func _on_exit_pressed() -> void:
	$clickaudio.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()


func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()
