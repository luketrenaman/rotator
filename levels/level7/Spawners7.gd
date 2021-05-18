extends Node2D
onready var BULLET = preload("res://bullets/bullet.tscn")
onready var ORANGEBULLET = preload("res://bullets/bullet_orange.tscn")
onready var Bullets = get_node("bullets")
onready var PLAYER = get_node("Player")
var angle = 0
signal victory
var ct = 160
var a = 0
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
		for i in range(0,2):
			var bul = BULLET.instance()
			var tangle = 0+i*PI
			bul.set_position(Vector2(cos(tangle)*160,sin(tangle)*160))
			
			bul.rotation = 0+i*PI-PI
			Bullets.add_child(bul)
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
		if a % 2 == 0:
			for j in range(-8,8):
				var bul = ORANGEBULLET.instance()
				bul.set_position(Vector2(j*40,sin(j+a*PI/4)*40-100))
				bul.rotation = PI/3
				Bullets.add_child(bul)
		else:
			for j in range(-8,8):
				var bul = ORANGEBULLET.instance()
				bul.set_position(Vector2(j*40,cos(2*j-a*PI/4)*40+100))
				bul.rotation = -PI/3
				Bullets.add_child(bul)
		a+=1
		ct -= 16
	if ct <= 0:
		$Timer2.stop()
		ct = 0
	$"../Label".text = str(ct)
	pass # Replace with function body.
