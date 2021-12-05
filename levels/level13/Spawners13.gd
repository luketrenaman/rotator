extends Node2D
onready var BULLET_INVERSE = preload("res://bullets/bullet_inverse.tscn")
onready var BULLET = preload("res://bullets/bullet.tscn")
onready var BULLET_ORANGE = preload("res://bullets/bullet_orange.tscn")
onready var Bullets = get_node("bullets")
signal victory
var ct = 500
var angle = 0
var a = 0
var b = 0

var c = 0

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

func stop_all_timers():
	$spiky.stop()
	$life2.stop()
	$skyspiky.stop()
	$lifespeed.stop()

func _on_Timer2_timeout():
	if len(Bullets.get_children()) < 300:
		for i in range(0,9):
			var bul = BULLET_INVERSE.instance()
			bul.set_position(Vector2(50,0))
			bul.rotation = float(i)*1/8*PI
			if i == 8:
				bul.set_position(Vector2(-250,0))
				bul.rotation = 0
			Bullets.add_child(bul)
			ct -= 1
		b += 1
		if ct < 0:
			stop_all_timers()
			ct = 0
		$"../Label".text = str(ct)

func _on_Timer_timeout():
	if len(Bullets.get_children()) < 300:
		var bul = BULLET.instance()
		bul.set_position(Vector2(50,0))
		var bpos = bul.get_position()
		bul.rotation = atan2(-bpos.y,-bpos.x) + float(a)*1/4*PI
		Bullets.add_child(bul)
		ct -= 1
		a += 1
	if ct < 0:
		stop_all_timers()
		ct = 0
	$"../Label".text = str(ct)
	pass #  with function body.


func _on_Timer3_timeout():
	if len(Bullets.get_children()) < 300:
		print("hey")
		var bul = BULLET.instance()
		bul.set_position(Vector2(300*cos(c - 3*PI/4),300*sin(c - 3*PI/4)))
		bul.rotation = PI/2
		var bul2 = BULLET.instance()
		bul2.set_position(Vector2(250*cos(c - 2*PI),250*sin(c - 2*PI)))
		bul2.rotation = PI/2
		c += PI / 8
		c = fmod(c,PI)
		ct -= 2
		Bullets.add_child(bul)
		Bullets.add_child(bul2)
		if ct < 0:
			stop_all_timers()
			ct = 0
	$"../Label".text = str(ct)
	pass # Replace with function body.


func _on_lifespeed_timeout():
	if len(Bullets.get_children()) < 300:
		var bul = BULLET_INVERSE.instance()
		bul.set_position(Vector2(-300,0))
		Bullets.add_child(bul)
		ct -= 1
	b += 1
	if ct < 0:
		stop_all_timers()
		ct = 0
	$"../Label".text = str(ct)
	pass # Replace with function body.
