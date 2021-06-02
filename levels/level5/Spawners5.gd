extends Node2D
onready var BULLET = preload("res://bullets/bullet.tscn")
onready var ORANGEBULLET = preload("res://bullets/bullet_orange.tscn")
onready var Bullets = get_node("bullets")
var angle = 0
signal victory
var ct = 300
var a = 0
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
#		for i in range(0,16):
#			var bul = BULLET.instance()
#			var angle = -PI/2
#			bul.set_position(Vector2(cos(angle),sin(angle))*160)
#			var bpos = bul.get_position()
#			bul.rotation = i * PI/8
#			Bullets.add_child(bul)
		for j in range(0,1):
			var bul = BULLET.instance()
			var tangle = PI/8*j-PI/2
			bul.set_position(Vector2(cos(tangle),sin(tangle))*(160+sin(ct)*80))
			var bpos = bul.get_position()
			bul.rotation = atan2(-bpos.y,-bpos.x)-ct*PI/4
			Bullets.add_child(bul)
		a += 1
		ct -= 1
	if ct <= 0:
		$Timer2.stop()
		ct = 0
	$"../Label".text = str(ct)
	pass # Replace with function body.
