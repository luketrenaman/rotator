extends Control
var bullet = preload("res://bullets/title_bullet.tscn")
onready var BULLETS = get_node("bullets")
var SPEED = 50
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if AudioManager.muted:
		$Mute.text = "Unmute"
	else:
		$Mute.text = "Mute"
	for _i in range(0,40):
		var bul = bullet.instance()
		BULLETS.add_child(bul)
		var angle = randf() * 2 * PI
		bul.rotation = angle + PI/2
		bul.angle = randf() * 2 *PI
		bul.position = floor((randf()*80+60)/6)*6 * Vector2(cos(angle),sin(angle))
		bul.magnitude = bul.position.length()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("rotate_left"):
		SPEED = -1
	elif Input.is_action_pressed("rotate_right"):
		SPEED = 2
	else:
		SPEED = 1
	for child in BULLETS.get_children():
		child.angle += delta * SPEED
		child.position = child.magnitude*Vector2(cos(child.angle),sin(child.angle))
		child.rotation = atan2(child.position.y,child.position.x) + PI/2
	pass


func _on_Button_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://menus/levelselect.tscn")

	pass # Replace with function body.


func _on_Mute_pressed():
	AudioManager.toggle_mute()
	if AudioManager.muted:
		$Mute.text = "Unmute"
	else:
		$Mute.text = "Mute"
	pass # Replace with function body.
