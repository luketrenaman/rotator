extends Node2D
onready var BULLET = preload("res://bullets/bullet.tscn")
onready var Bullets = get_node("bullets")
var angle = 0
signal victory
var ct = 40
var alt = false
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
		for i in range(0,5):
			var bul = BULLET.instance()
			var angle = (i-ct)*PI/7
			bul.set_position(Vector2(cos(angle),sin(angle))*(160+i*4))
			var bpos = bul.get_position()
			bul.rotation = angle+PI+PI/7*i
			Bullets.add_child(bul)
		ct -= 5
	$"../Label".text = str(ct)
	if ct == 0:
		$Timer.stop()
	pass # Replace with function body.


func _on_starter_timeout():
	_on_Timer_timeout()
	pass # Replace with function body.
