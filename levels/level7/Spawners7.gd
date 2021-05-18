extends Node2D
onready var BULLET = preload("res://bullets/bullet.tscn")
onready var ORANGEBULLET = preload("res://bullets/bullet_orange.tscn")
onready var TUNNEL = preload("res://bullets/tunnel.tscn")
onready var Bullets = get_node("bullets")
onready var PLAYER = get_node("Player")
var angle = 0
var tunnel
signal victory
var ct = 1
var a = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	tunnel = TUNNEL.instance()
	tunnel.protation = PI/2
	Bullets.add_child(tunnel)
	
	for j in range(-30,0):
		var bul = ORANGEBULLET.instance()
		var pos:Vector2 = Vector2(-40,-90-j*15)
		bul.set_position(pos)
		bul.rotation = tunnel.protation
		tunnel.add_child(bul)
	for j in range(-30,0):
		var bul = ORANGEBULLET.instance()
		var pos:Vector2 = Vector2(40,-90-j*15)
		bul.set_position(pos)
		bul.rotation = tunnel.protation
		tunnel.add_child(bul)
		Bullets.add_child(tunnel)
	for j in range(0,75):
		var bul = ORANGEBULLET.instance()
		var pos:Vector2 = Vector2(40*(sin(float(j)/4+PI)+1),-90-j*15)
		bul.set_position(pos)
		bul.rotation = tunnel.protation
		tunnel.add_child(bul)
		Bullets.add_child(tunnel)
	for j in range(0,75):
		var bul = ORANGEBULLET.instance()
		var pos:Vector2 = Vector2(-40*(sin(float(j)/4)+1),-90-j*15)
		bul.set_position(pos)
		bul.rotation = tunnel.protation
		tunnel.add_child(bul)
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
		for j in range(6,24):
			var tunnel = TUNNEL.instance()
			tunnel.protation = PI/4
			var bul = ORANGEBULLET.instance()
			bul.set_position(Vector2(-j*10+60,-110-(j-10)*10))
			bul.rotation = PI/4
			tunnel.add_child(bul)
			Bullets.add_child(tunnel)
		for j in range(10,24):
			var tunnel = TUNNEL.instance()
			tunnel.protation = PI/4
			var bul = ORANGEBULLET.instance()
			bul.set_position(Vector2(-j*10+60,-30-(j-10)*10))
			bul.rotation = PI/4
			tunnel.add_child(bul)
			Bullets.add_child(tunnel)
		ct -= 2
	if ct <= 0:
		$Timer.stop()
		ct = 0
	$"../Label".text = str(ct)
	pass # Replace with function body.


func _on_Timer2_timeout():
	if len(Bullets.get_children()) < 300:
#		for i in range(0,16):
#			var bul = BULLET.instance()
#			var angle = -PI/2
#			bul.set_position(Vector2(cos(angle),sin(angle))*160)
#			var bpos = bul.get_position()
#			bul.rotation = i * PI/8
#			Bullets.add_child(bul)
		a+=1
		ct -= 300
	if ct <= 0:
		$Timer2.stop()
		ct = 0
	$"../Label".text = str(ct)
	pass # Replace with function body.
