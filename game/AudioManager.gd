extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var master_sound = AudioServer.get_bus_index("Master")
var muted = false
var ct = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	$MDM.quickplay("Menu")
	if muted:
		AudioServer.set_bus_mute(master_sound, false)
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
func toggle_mute():
	muted = not muted
	start_mute()
func start_mute():
	if muted:
		AudioServer.set_bus_mute(master_sound, true)
	else:
		AudioServer.set_bus_mute(master_sound, false)
	Global.save_game()
