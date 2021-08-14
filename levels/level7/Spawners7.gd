extends Node2D
onready var BULLET = preload("res://bullets/bullet.tscn")
onready var TUNNEL = preload("res://bullets/tunnel.tscn")
onready var TUNNELBULLET = preload("res://bullets/tunnel_bullet.tscn")
onready var Bullets = get_node("bullets")
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
		var bul = TUNNELBULLET.instance()
		var pos:Vector2 = Vector2(-40-j,-90-j*15)
		bul.set_position(pos)
		bul.rotation = tunnel.protation
		tunnel.add_child(bul)
	for j in range(-30,0):
		var bul = TUNNELBULLET.instance()
		var pos:Vector2 = Vector2(40+j,-90-j*15)
		bul.set_position(pos)
		bul.rotation = tunnel.protation
		tunnel.add_child(bul)
	for j in range(0,75):
		var bul = TUNNELBULLET.instance()
		var pos:Vector2 = Vector2(40*(sin(float(j)/4+PI)+1),-90-j*15)
		bul.set_position(pos)
		bul.rotation = tunnel.protation
		tunnel.add_child(bul)
	for j in range(0,75):
		var bul = TUNNELBULLET.instance()
		var pos:Vector2 = Vector2(-40*(sin(float(j)/4)+1),-90-j*15)
		bul.set_position(pos)
		bul.rotation = tunnel.protation
		tunnel.add_child(bul)
	self.connect("victory", get_parent(), "_on_victory")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if len(Bullets.get_children()) == 0:
		emit_signal("victory")
		$Timer2.stop()
	pass


func _on_Timer2_timeout():
	if len(tunnel.get_children()) == 0:
		return
	var farthest = tunnel.get_children()[tunnel.get_child_count()-1]
	if (farthest.get_position().length()-120) <= 0 or ct <= 0:
		ct = 0
	else:
		ct = (farthest.get_position().length()-120)/1100
		
	$"../Label".text = str(ceil(ct*100)) + "%"
	pass # Replace with function body.
