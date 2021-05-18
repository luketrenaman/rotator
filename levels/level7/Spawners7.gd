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
