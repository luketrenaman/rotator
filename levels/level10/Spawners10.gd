extends Node2D
onready var BULLET_INVERSE = preload("res://bullets/bullet_inverse.tscn")
onready var BULLET = preload("res://bullets/bullet.tscn")
onready var BULLET_ORANGE = preload("res://bullets/bullet_orange.tscn")
onready var Bullets = get_node("bullets")
signal victory
var ct = 250
var angle = 0
var a = 0
var b = 0

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
	for i in range(0,24):
		var bul = BULLET_ORANGE.instance()
		bul.set_position(Vector2(cos(i*PI/24*2),sin(i*PI/24*2))*160)
		var bpos = bul.get_position()
		bul.rotation = float(b)*1/4*PI
		Bullets.add_child(bul)
	if ct < 0:
		$Timer.stop()
		$Timer2.stop()
		ct = 0
	$"../Label".text = str(ct)
	ct -= 24
	b += 1

func _on_Timer_timeout():
	if len(Bullets.get_children()) < 300:
		var bul = BULLET.instance()
		bul.set_position(Vector2(cos(a*PI/4),sin(a*PI/4))*160)
		var bpos = bul.get_position()
		bul.rotation = atan2(-bpos.y,-bpos.x) + float(a)*1/4*PI
		Bullets.add_child(bul)
		ct -= 1
		a += 1
	if ct < 0:
		$Timer.stop()
		$Timer2.stop()
		ct = 0
	$"../Label".text = str(ct)
	pass #  with function body.
