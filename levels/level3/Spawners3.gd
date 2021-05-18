extends Node2D
onready var BULLET = preload("res://bullet.tscn")
onready var ORANGEBULLET = preload("res://bullet_orange.tscn")
onready var Bullets = get_node("bullets")
signal victory
var ct = 160
var q = 0
var irange = 20
var angle = 0
var anglesector = PI*1/2
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
	pass

func _on_Timer_timeout():
	if len(Bullets.get_children()) < 300:
		for i in range(0,irange):
			var bul = ORANGEBULLET.instance()
			var spawn_offset = q * PI/2
			var angle = i*anglesector/irange+spawn_offset
			bul.set_position(Vector2(cos(angle),sin(angle))*160)
			bul.rotation = spawn_offset + 5*PI/4
			Bullets.add_child(bul)
			ct -= 1
		q+=1
	$"../Label".text = str(ct)
	if ct == 0:
		$Timer.stop()
	pass # Replace with function body.
