extends Node2D
onready var BULLET = preload("res://bullets/bullet.tscn")
onready var ORANGEBULLET = preload("res://bullets/bullet_orange.tscn")
onready var Bullets = get_node("bullets")
var angle = 0
signal victory
var ct = 250
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

func _on_Timer_timeout():
	if len(Bullets.get_children()) < 300:
		for i in range(0,10):
			var bul = ORANGEBULLET.instance()
			var angle = 3*PI/2 + int(ct / 10) * PI/4
			bul.set_position(Vector2(cos(angle-i*PI/80),sin(angle-i*PI/80))*160)
			var bpos = bul.get_position()
			bul.rotation = angle+PI- PI/16
			Bullets.add_child(bul)
		ct -= 10
	$"../Label".text = str(ct)
	if ct == 0:
		$Timer.stop()
	pass # Replace with function body.
