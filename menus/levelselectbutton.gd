extends Control
signal pressed
var val = 0
func _ready():
	self.connect("pressed", get_parent(), "_on_Control_pressed")
func _on_Button_pressed():
	emit_signal("pressed",$Button.text)
	pass # Replace with function body.
