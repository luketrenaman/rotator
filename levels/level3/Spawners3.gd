extends Node2D
onready var BULLET = preload("res://bullet.tscn")
onready var ORANGEBULLET = preload("res://bullet_orange.tscn")
onready var Bullets = get_node("bullets")
onready var PLAYER = get_node("Player")
var angle = 0
signal victory
var ct = 200
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
		for i in range(0,20):
			var bul = BULLET.instance()
			var angle = 3*PI/2 + int(ct / 20) * PI/4
			bul.set_position(Vector2(cos(angle-i*PI/40),sin(angle-i*PI/40))*160)
			var bpos = bul.get_position()
			bul.rotation = angle+PI- PI/4
			Bullets.add_child(bul)
		ct -= 20
	$"../Label".text = str(ct)
	if ct == 0:
		$Timer.stop()
	pass # Replace with function body.
