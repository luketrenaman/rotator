extends GridContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var ct = 0
	for child in get_children():
		ct += 1
		var btn:Button = child.get_node("Button")
		btn.text = str(ct)
		if ct > Global.levels_completed + 1:
			btn.disabled = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_Control_pressed(val):
	Global.current_level = int(val)
	get_tree().change_scene("res://levels/level"+val+"/"+"level"+val+".tscn")

func _on_Button_pressed():
	get_tree().change_scene("res://titlescreen.tscn")
	pass # Replace with function body.