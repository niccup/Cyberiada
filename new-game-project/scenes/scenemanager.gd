extends Node
var spath = ""
func changescene(path, trans):
	print("o")
	if trans == 1:
		spath=path
		$transition/AnimationPlayer.play("fadein")
		$transition/transition/TextureRect.show()
		$transition/transition/Label.show()
	elif trans == 2:
		spath=path
		$transition/AnimationPlayer.play("fadein")
		$transition/transition/TextureRect.hide()
		$transition/transition/Label.hide()
	else:
		$scene.get_child(0).queue_free()
		var inst = load(path).instantiate()
		$scene.add_child(inst)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fadein":
		$scene.get_child(0).queue_free()
		var inst = load(spath).instantiate()
		$scene.add_child(inst)
		$transition/AnimationPlayer.play("fadeout")
