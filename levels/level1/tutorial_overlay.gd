extends Sprite

var gone = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if modulate == Color(1,1,1,1) and (Input.is_action_pressed("rotate_left") or Input.is_action_pressed("rotate_right")) and not gone:
		gone = true
		$AnimationPlayer.play("fade_out")
	pass
