
extends Node2D
onready var BULLET_INVERSE = preload("res://bullets/bullet_inverse.tscn")
onready var ORANGEBULLET = preload("res://bullets/bullet_orange.tscn")
onready var Bullets = get_node("bullets")
signal victory
var ct = 147
var angle = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	_on_Timer_timeout()
	_on_Timer2_timeout()
	self.connect("victory", get_parent(), "_on_victory")
	$"../Label".text = str(ct)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ct == 0 and len(Bullets.get_children()) == 0:
		emit_signal("victory")
	pass
func _on_Timer_timeout():
	if len(Bullets.get_children()) < 300:
		for i in range(0,10):
			var bul = ORANGEBULLET.instance()
			var angle = -PI/8-PI+float(i)/5*PI/4
			bul.set_position(Vector2(cos(angle),sin(angle))*80+Vector2(0,80))
			var bpos = bul.get_position()
			bul.rotation = -PI/2
			Bullets.add_child(bul)
		for i in range(0,10):
			var bul = ORANGEBULLET.instance()
			var angle = -PI/8+float(i)/5*PI/4
			bul.set_position(Vector2(cos(angle),sin(angle))*80+Vector2(0,80))
			var bpos = bul.get_position()
			bul.rotation = -PI/2
			Bullets.add_child(bul)
		ct -= 20
		if ct <= 0:
			$Timer.stop()
			$Timer2.stop()
			ct = 0
		$"../Label".text = str(ct)
func _on_Timer2_timeout():
	var bul = BULLET_INVERSE.instance()
	bul.set_position(Vector2(0,-160))
	var bpos = bul.get_position()
	bul.rotation = -PI/2
	Bullets.add_child(bul)
	ct -= 1
	if ct <= 0:
		$Timer.stop()
		$Timer2.stop()
		ct = 0
	$"../Label".text = str(ct)
	pass # Replace with function body.
	pass # Replace with function body.
