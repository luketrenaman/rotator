extends Node2D
onready var BULLET = preload("res://bullets/bullet.tscn")
onready var ORANGEBULLET = preload("res://bullets/bullet_orange.tscn")
onready var Bullets = get_node("bullets")
signal victory
var ct = 300
var angle = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var irange = 20
var jrange = 10
var anglesector = PI*1/2
var offset = 3*PI/4
# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("victory", get_parent(), "_on_victory")
	$"../Label".text = str(ct)
	set_process(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ct == 0 and len(Bullets.get_children()) == 0:
		emit_signal("victory")


func _on_Timer1_timeout():
	if len(Bullets.get_children()) < 300:
		for j in range (0,jrange):
			var bul = BULLET.instance()
			bul.set_position(Vector2(cos(j*2*PI/jrange),sin(j*2*PI/jrange))*240)
			var bpos = bul.get_position()
			if j % 2 == 0:
				bul.rotation = atan2(-bpos.y,-bpos.x) + PI/2
			else:
				bul.rotation = atan2(-bpos.y,-bpos.x) - PI/2
			Bullets.add_child(bul)
			ct -= 1
		for i in range(0,irange):
			var bul = ORANGEBULLET.instance()
			bul.set_position(Vector2(cos(i*anglesector/irange+offset),sin(i*anglesector/irange+offset))*160)
			Bullets.add_child(bul)
			ct -= 1
	$"../Label".text = str(ct)
	if ct == 0:
		$Timer1.stop()
	pass # Replace with function body.
