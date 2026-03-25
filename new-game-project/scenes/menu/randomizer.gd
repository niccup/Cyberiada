extends Label

var splashes : Array = [
	"akszyli for THE millions", 
	"dexter zrób milion sprite'ów", 
	"GDZIE PUSTYNIA", 
	"TRZY PLANETY", 
	"jakie przyciski do kopalni?"
]

func _ready() -> void:
	pivot_offset = size / 2
	
	text = splashes.pick_random()

func _process(delta: float) -> void:

	var pulse = 1.0 + abs(sin(Time.get_ticks_msec() * 0.003)) * 0.05
	scale = Vector2(pulse, pulse)

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.is_echo():
		if event.keycode == KEY_SPACE:
			text = splashes.pick_random()
			pivot_offset = size / 2
