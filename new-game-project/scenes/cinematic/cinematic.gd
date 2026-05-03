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
	Global.changescene("uid://b4ktnmcr7dwaa", 1)


func _on_back_pressed() -> void:
	Global.changescene("uid://cv74w5igteoxc", 2)
	
