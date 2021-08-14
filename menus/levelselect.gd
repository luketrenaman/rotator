extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if AudioManager.muted:
		$Mute.text = "Unmute"
	else:
		$Mute.text = "Mute"
	pass # Replace with function body.
func _process(delta):
	if Input.is_action_just_pressed("mute"):
		_on_Mute_pressed()
func _on_Mute_pressed():
	AudioManager.toggle_mute()
	if AudioManager.muted:
		$Mute.text = "Unmute"
	else:
		$Mute.text = "Mute"
	pass # Replace with function body.
