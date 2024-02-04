extends Node2D

const P0_WHITE = Color8(255, 255, 255)
const P0_RED = Color8(237, 30, 36)

var _current_palette_index = 0
var _all_palettes: Array = [
	ColorPalette.new(P0_WHITE, P0_RED)
]

@onready var _current_palette: ColorPalette = _all_palettes[_current_palette_index]

func get_current_palette() -> ColorPalette:
	return _current_palette

func change_palette(move_amount: int):
	_current_palette_index = (_current_palette_index + move_amount) % _all_palettes.size()
	_current_palette = _all_palettes[_current_palette_index]
