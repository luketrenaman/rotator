extends Node2D
export var expand_mult = 1.0
export var max_dist = 250
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mobile_rotate_left = false
var mobile_rotate_right = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#set_process(false)
	pass # Replace with function body.
func _input(event):
	if event is InputEventScreenTouch && event.is_pressed():
		mobile_rotate_left = event.position.x <= 300
		mobile_rotate_right = event.position.x > 300
	else:
		mobile_rotate_left = false
		mobile_rotate_right = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("rotate_left") or mobile_rotate_left:
		$Area2D.position.x -= delta*50
		$Area2D2.position.x -= delta*50
	if Input.is_action_pressed("rotate_right") or mobile_rotate_right:
		$Area2D.position.x += delta*50
		$Area2D2.position.x += delta*50
	$Area2D.position.x -= delta*10 * expand_mult
	if $Area2D.position.x < -max_dist:
		$Area2D.position.x = -max_dist
	$Area2D2.position.x += delta*10 * expand_mult
	if $Area2D2.position.x > max_dist:
		$Area2D2.position.x = max_dist
	pass


#func _on_Timer_timeout():
#	set_process(true)
#	pass # Replace with function body.
