extends Node2D
onready var TUNNELBULLET = preload("res://bullets/tunnel_bullet.tscn")
onready var TUNNEL = preload("res://bullets/tunnel.tscn")
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
	
	for j in range(0,20):
		var bul = TUNNELBULLET.instance()
		var pos:Vector2 = Vector2(0,60)
		pos = pos.rotated(float(j)/20*2*PI)
		pos -= Vector2(80,80)
		bul.set_position(pos)
		bul.rotation = tunnel.protation
		tunnel.add_child(bul)
	for j in range(0,38):
		var bul = TUNNELBULLET.instance()
		var pos:Vector2 = Vector2(0,140)
		pos = pos.rotated(float(j)/40*2*PI)
		pos -= Vector2(80,80)
		bul.set_position(pos)
		bul.rotation = tunnel.protation
		tunnel.add_child(bul)
	for j in range(0,80):
		if j >= 36 and j <= 44:
			continue
		var bul = TUNNELBULLET.instance()
		var pos:Vector2 = Vector2(0,280)
		pos = pos.rotated(float(j)/80*2*PI)
		pos -= Vector2(80,80)
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
	var farthest = tunnel.get_children()[tunnel.get_child_count()-1]
	if (farthest.get_position().length()) <= 0 or ct <= 0:
		ct = 0
	else:
		ct = (400-farthest.get_position().length())/320
		
	$"../Label".text = str(ceil(ct*100)) + "%"
	pass # Replace with function body.
