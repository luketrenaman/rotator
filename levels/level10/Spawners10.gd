extends Node2D
onready var TUNNELBULLET = preload("res://bullets/tunnel_bullet.tscn")
onready var TUNNEL = preload("res://bullets/tunnel.tscn")
onready var Bullets = get_node("bullets")
var angle = 0
var tunnel
signal victory
var ct_mod = 0
var ct = 1
var val = 2
var a = 1
var center
# Called when the node enters the scene tree for the first time.
func _ready():
	tunnel = TUNNEL.instance()
	tunnel.protation = PI/2
	Bullets.add_child(tunnel)
	center = TUNNELBULLET.instance()
	center.set_position(Vector2(-80,-80))
	center.visible = false
	tunnel.add_child(center)
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
	if is_instance_valid(center):
		ct = 1-((center.get_position().length()-120)/480) - ct_mod
		if val > .60:
			ct_mod += delta/30
		elif val > .25:
			ct_mod += delta/80
		if ct < val:
			val = ct
		if val < 0:
			val = 0
		if val > 1:
			val = 1
		$"../Label".text = str(ceil(val*100)) + "%"
	if len(Bullets.get_children()) == 0:
		emit_signal("victory")
		set_process(false)


