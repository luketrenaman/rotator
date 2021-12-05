extends Area2D
signal escaped

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.x = 300-get_node("../Lifespan").life * 7
	if self.position.x < -20:
		emit_signal("escaped")
		queue_free()
	pass
