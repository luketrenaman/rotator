extends Control
var bullet = preload("bullets/bullet.tscn")
onready var BULLETS = get_node("bullets")
var SPEED = 50
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0,40):
		var bul = bullet.instance()
		BULLETS.add_child(bul)
		var angle = randf() * 2 * PI
		bul.rotation = angle + PI/2
		bul.position = floor((randf()*80+20)/6)*6 * Vector2(cos(angle),sin(angle))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("rotate_left"):
		SPEED = -50
	elif Input.is_action_pressed("rotate_right"):
		SPEED = 100
	else:
		SPEED = 50
	for child in BULLETS.get_children():
		child.position += Vector2(cos(child.rotation),sin(child.rotation)) * delta * SPEED
		child.rotation = atan2(child.position.y,child.position.x) + PI/2
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://levelselect.tscn")

	pass # Replace with function body.
