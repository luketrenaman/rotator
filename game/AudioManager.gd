extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ct = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	$MDM.quickplay("Menu")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func punctuate_song(song):
	$MDM.play_mode = 0
	$MDM._change_song(song)
func change_song(song):
	$MDM.play_mode = 1
	$MDM._change_song(song)
func stop():
	$MDM.playing = false
	$MDM._stop_overlays()
