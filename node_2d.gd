extends Node2D

@onready
var tileMapHigh
var tileMapMiddle
var tileMapLow
var cellsHigh
var cellsMiddle
var cellsLow
var originOffset
var divCounter
var maxOffset = Vector2(0, 768)
var shiftTiles = false
var waveTween;

func _ready() -> void:
	tileMapHigh = get_node("WaveLayerWrapper").get_child(0);
	tileMapMiddle = get_node("MiddleLayer")
	tileMapLow = get_node("BottomLayer")
	cellsHigh = tileMapHigh.get_used_cells()
	cellsMiddle = tileMapMiddle.get_used_cells()
	cellsLow = tileMapLow.get_used_cells()
	originOffset = 0
	divCounter = 3
	ripple()

func ripple():
	#var tween4 = create_tween()
	#tween4.set_ease(Tween.EASE_IN_OUT)
	#tween4.set_loops()
	#tween4.tween_property(tileMapMiddle, "modulate", Color(1, 1, 1, 0), 2)
	#tween4.tween_property(tileMapMiddle, "modulate", Color(1, 1, 1, 1), 2)
	for cell in cellsMiddle:
		var tween5 = create_tween()
		tween5.set_loops();
		var tileData = tileMapMiddle.get_cell_tile_data(cell)
		tween5.tween_property(tileData, "flip_v", true, 0.5)
		tween5.tween_property(tileData, "flip_v", false, 0.5)
		tween5.tween_property(tileData, "flip_h", true, 0.5)
		tween5.tween_property(tileData, "flip_h", false, 0.5)
		

func waves():
	var tween3 = create_tween()
	tween3.set_loops()
	tween3.tween_property(tileMapHigh, "skew", 0.01, 0.5)
	tween3.tween_property(tileMapHigh, "skew", 0, 0.5)
	tween3.tween_property(tileMapHigh, "skew", -0.01, 0.5)

	var tween2 = create_tween()
	tween2.tween_property(tileMapHigh, "modulate", Color(1, 1, 1, 1), 1)
	tween2.tween_property(tileMapHigh, "modulate", Color(1, 1, 1, 0), 1)
	tween2.set_loops()
