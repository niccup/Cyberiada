extends Node2D
var cord = Vector2(0,0)
var tset = false
var builddata = {
"tower": [[0, Vector2(0,1)],[],[]],
"powerplant": [[0, Vector2(2,0)],[],[]], 
"waterpump":[[0, Vector2(0,0)],[],[]],
"foodsupply": [[0, Vector2(0,2)],[],[]],
"house":[[0, Vector2(0,3)],[],[]],
"street":[[1, Vector2(2,1)],[],[]],
"plant": [[0, Vector2(3,0)],[],[]]}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

				#$poiter/TextureRect.hide()
			
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Global.selectbuild[0][0 ]!=  "":
		
		if tset == false:
			$poiter/TextureRect.show()
			tset=true
			$poiter/TextureRect.texture = Global.selectbuild[2]
			$poiter/TextureRect.texture = AtlasTexture.new()
			$poiter/TextureRect.texture.atlas = Global.selectbuild[2]
			$poiter/TextureRect.texture.region = Global.selectbuild[1]
	
	$CanvasLayer/Control/moneycounter.text = "$"+ "%06d" % Global.money
	var tile_w = 1024.0
	var tile_h = 410.0
	var map_scale = 0.1
	var screen_x = (cord.x - cord.y) * (tile_w / 2.0) #- 1
	var screen_y = (cord.x + cord.y) * (tile_h / 2.0) 
	%posx.text = "pozycja x: " + str(int(cord.x))
	%posy.text = "pozycja y: " + str(int(cord.y))
	var final_pos = Vector2(screen_x, screen_y) * map_scale
	$poiter.position = final_pos - Vector2($poiter.size.y/2,$poiter.size.y/2) 
	%type.text = "typ: " + str($TileMapLayer.get_cell_source_id(Vector2(floor(cord.x-1),floor(cord.y)) ))
	if visible:
		$CanvasLayer.show()
	else:
		$CanvasLayer.hide()
	#$poiter.position = cord * Vector2(102.4/2,-41.0/2.0)  + Vector2(0,$poiter.size.y/2) + Vector2(-102.4/2.0*1, -41/2.0*7)

	$Camera2D.position = $Camera2D.position.lerp(final_pos, 0.1) + Vector2(0,5)
	#$Camera2D.position.x = lerp($Camera2D.position.x, cord.x * 102.4/2, 0.1) 
	#$Camera2D.position.y = lerp($Camera2D.position.y, cord.y * -41.0/2.0, 0.1  ) #+ -41 *3)

func addinput(input):
	match input:
		"l":
			cord.x -=1
			#cord.y +=1
		"r":
			cord.x +=1
		#	cord.y -=1
		"u":
			cord.y -=1
			#cord.x +=1
		"d":
			cord.y +=1
			#cord.x -=1
		"destroy":
			if ($TileMapLayer.get_cell_source_id(Vector2(floor(cord.x-1),floor(cord.y)) )) == 7:
				Global.money+=12
			$TileMapLayer.set_cell(Vector2(floor(cord.x-1),floor(cord.y)), -1, Vector2(-1,-1))
		"enter":
			if tset == true:
				if Global.selectbuild[0][0]!=  "":
					if abs(cord.x) < 9:
						if abs(cord.y) < 9:
							if Global.money >= Global.selectbuild[3]:
								var buildtype = Global.selectbuild[0][0]
								var buildlevel = Global.selectbuild[0][1]-1
								print(builddata[buildtype][buildlevel][0])
								Global.money -= Global.selectbuild[3]
								$TileMapLayer.set_cell(Vector2(cord.x-1,cord.y), builddata[buildtype][buildlevel][0],builddata[buildtype][buildlevel][1])
								tset=false
							else:
								Global.selectbuild[0][0 ]=  ""
								tset=false
								$poiter/TextureRect.hide()
							
		"back":
			Global.selectbuild[0][0 ]=  ""
			tset=false
			$poiter/TextureRect.hide()
