extends Node2D
onready var TIMER = get_node("../Timer")
enum BTYPES{bullet,inverse,orange}
func _process(delta):
	var lowest = 500
	for child in self.get_children():
		if child.type == BTYPES.inverse:
			child.position += Vector2(cos(child.rotation),sin(child.rotation)) * delta * 100
		else:
			child.position += Vector2(cos(child.rotation),sin(child.rotation)) * delta * 50
		if child.position.length() < lowest:
			lowest = child.position.length()
		if child.position.length() > 320:
			child.queue_free()
	pass
func rotate(delta):
	for child in self.get_children():
		if child.type == BTYPES.inverse:
			child.rotation -= delta * 1.5
			continue
		if child.type == BTYPES.orange:
			var pos = child.get_position()
			var magnitude = child.position.length()
			var angle = atan2(pos.y,pos.x) + delta/2
			child.set_position(magnitude * Vector2(cos(angle),sin(angle)))
			continue
		else:
			child.rotation += delta * 0.75
