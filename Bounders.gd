extends Node2D
export var expand_mult = 1

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("rotate_left"):
		$Area2D.position.x -= delta*50
		$Area2D2.position.x -= delta*50
	if Input.is_action_pressed("rotate_right"):
		$Area2D.position.x += delta*50
		$Area2D2.position.x += delta*50
	$Area2D.position.x -= delta*10 * expand_mult
	if $Area2D.position.x < -250:
		$Area2D.position.x = -250
	$Area2D2.position.x += delta*10 * expand_mult
	if $Area2D2.position.x > 250:
		$Area2D2.position.x = 250
	pass
