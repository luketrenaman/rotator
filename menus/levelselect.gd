extends Control
onready var RED_BUTTON = preload("res://menus/red_button.tres")
onready var BLACK_BUTTON = preload("res://menus/black_button.tres")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if AudioManager.muted:
		$Mute.text = "Unmute"
		$Mute.theme = BLACK_BUTTON
	else:
		$Mute.text = "Mute"
		$Mute.theme = RED_BUTTON
func _process(delta):
	if Input.is_action_just_pressed("mute"):
		_on_Mute_pressed()
func _on_Mute_pressed():
	AudioManager.toggle_mute()
	if AudioManager.muted:
		$Mute.text = "Unmute"
		$Mute.theme = BLACK_BUTTON
	else:
		$Mute.text = "Mute"
		$Mute.theme = RED_BUTTON
	pass # Replace with function body.
