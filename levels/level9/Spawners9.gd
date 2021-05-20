
extends Node2D
onready var BULLET_INVERSE = preload("res://bullets/bullet_inverse.tscn")
onready var BULLET = preload("res://bullets/bullet.tscn")
onready var Bullets = get_node("bullets")
signal victory
var ct = 80
var angle = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("victory", get_parent(), "_on_victory")
	$"../Label".text = str(ct)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ct == 0 and len(Bullets.get_children()) == 0:
		emit_signal("victory")
	pass

func _on_Timer2_timeout():
	if len(Bullets.get_children()) < 300:
		if ct % 5 == 0:
			var bul = BULLET_INVERSE.instance()
			bul.set_position(Vector2(cos(ct*PI/16),sin(ct*PI/16))*160)
			var bpos = bul.get_position()
			bul.rotation = atan2(-bpos.y,-bpos.x) + (ct % 8 - 4) * PI/30 + PI/4
			Bullets.add_child(bul)
		else:
			var bul = BULLET.instance()
			bul.set_position(Vector2(cos(ct*PI/16),sin(ct*PI/16))*160)
			var bpos = bul.get_position()
			bul.rotation = atan2(-bpos.y,-bpos.x) + (ct % 8 - 4) * PI/30
			Bullets.add_child(bul)
		ct -= 1
	if ct <= 0:
		$Timer2.stop()
		ct = 0
	$"../Label".text = str(ct)
	pass # Replace with function body.
	pass # Replace with function body.
