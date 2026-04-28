extends TileMapLayer


var modulated_cells:Dictionary
func _ready() -> void:
	notify_runtime_tile_data_update()
func _use_tile_data_runtime_update(coords: Vector2i) -> bool:
	return modulated_cells.has(coords)
func _tile_data_runtime_update(coords: Vector2i, tile_data: TileData) -> void:
	tile_data.modulate = modulated_cells.get(coords, Color.WHITE)
	
