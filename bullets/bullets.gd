extends Node2D
func _process(delta):
	var lowest = 500
	for child in self.get_children():
		if child.type == Global.BTYPES.tunnel:
			if true or not (Input.is_action_pressed("rotate_left") or Input.is_action_pressed("rotate_right")):
				var del = true
				for subchild in child.get_children():
					subchild.position += Vector2(cos(child.protation),sin(child.protation)) * delta * 50
					if not subchild.position.length() > 320:
						del = false
				if del:
					child.queue_free()
			continue
		if child.type == Global.BTYPES.inverse:
			child.position += Vector2(cos(child.rotation),sin(child.rotation)) * delta * 60
		else:
			child.position += Vector2(cos(child.rotation),sin(child.rotation)) * delta * 50
		if child.position.length() < lowest:
			lowest = child.position.length()
		if child.position.length() > 320:
			child.queue_free()
	pass
func rotate(delta):
	for child in self.get_children():
		if child.type == Global.BTYPES.tunnel:
			child.protation += delta * 0.75
			for subchild in child.get_children():
				subchild.rotation += delta * 0.75
				var pos = subchild.get_position()
				var magnitude = subchild.position.length()
				var angle = atan2(pos.y,pos.x) + delta/2
				subchild.set_position(magnitude * Vector2(cos(angle),sin(angle)))
			continue
		if child.type == Global.BTYPES.inverse:
			child.rotation += delta * 1
			continue
		if child.type == Global.BTYPES.orange:
			var pos = child.get_position()
			var magnitude = child.position.length()
			var angle = atan2(pos.y,pos.x) + delta/2
			child.set_position(magnitude * Vector2(cos(angle),sin(angle)))
			continue
		else:
			child.rotation += delta * 0.75
