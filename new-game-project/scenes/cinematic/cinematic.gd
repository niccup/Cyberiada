extends Control

func _ready():
	var screen = $CanvasLayer/blackscreen 
	screen.modulate.a = 1.0
	var fade_tween = create_tween()
	fade_tween.tween_property(screen, "modulate:a", 0.0, 3.0)
	fade_tween.tween_callback(screen.queue_free)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_contcinematic_pressed() -> void:
	get_tree().change_scene_to_file("uid://ce7pkv4epp1tm")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("uid://cv74w5igteoxc")
