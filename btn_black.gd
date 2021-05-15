extends Button

const STYLENAME = "black"

func _ready():
	var style = get_theme().get_stylebox(STYLENAME, "Button")
	add_stylebox_override("button", style)
