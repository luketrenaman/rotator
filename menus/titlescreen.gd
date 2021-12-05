extends Control
var bullet = preload("res://bullets/title_bullet.tscn")
onready var BULLETS = get_node("bullets")
var SPEED = 50
onready var RED_BUTTON = preload("res://menus/red_button.tres")
onready var BLACK_BUTTON = preload("res://menus/black_button.tres")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var p1 = 0
var p2 = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	check_encore_unlocked()
	AudioManager.start_mute()
	if AudioManager.muted:
		$Mute.text = "Unmute"
		$Mute.theme = BLACK_BUTTON
	else:
		$Mute.text = "Mute"
		$Mute.theme = RED_BUTTON
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
	if Input.is_action_just_pressed("mute"):
		_on_Mute_pressed()
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
		$Mute.theme = BLACK_BUTTON
	else:
		$Mute.text = "Mute"
		$Mute.theme = RED_BUTTON
	pass # Replace with function body.

func check_encore_unlocked():
	if (Global.levels_completed >= 12 and p1 >= 3 and p2 >= 3) or Global.encore_unlocked and not (p2 >= 10):
		$player.visible = false
		$bullets.visible = false
		$encore.visible = true
		$encore/Button4.disabled = false
		Global.encore_unlocked = true
		Global.save_game()
	else:
		$player.visible = true
		$bullets.visible = true
		$encore.visible = false
		$encore/Button4.disabled = true
		Global.encore_unlocked = false
		Global.save_game()
func _on_Button2_pressed():
	p1 += 1
	check_encore_unlocked()
	pass # Replace with function body.


func _on_Button3_pressed():
	p2 += 1
	check_encore_unlocked()
	pass # Replace with function body.



func _on_Button4_pressed():
	Global.current_level = 13
	get_tree().change_scene("res://levels/level13/"+"level13.tscn")
	pass # Replace with function body.
