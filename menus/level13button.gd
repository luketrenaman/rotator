extends Control

onready var YELLOW_BUTTON = preload("res://menus/yellow_button.tres")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.levels_completed <= 13:
		$Button4.theme = YELLOW_BUTTON
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
