extends Node2D
onready var SPAWNERS = get_node("Spawners")
onready var BULLETS = get_node("Spawners/bullets")
onready var PLAYER = get_node("Player")
enum BTYPES{bullet,inverse,orange,bounder}
var ticks = 5
var angle = 0
var tangle = 0
var victory = false
func _process(delta):
	if Input.is_action_pressed("rotate_left"):
		BULLETS.rotate(-delta*3)
		SPAWNERS.angle -= delta*3
		#angle += -delta*3
		#tangle += -delta*3
	elif Input.is_action_pressed("rotate_right"):
		BULLETS.rotate(delta*3)
		SPAWNERS.angle += delta*3
		#angle += delta*3
		#tangle += delta*3


func _on_Player_area_entered(area):
	if not victory:
		if not area.type == BTYPES.inverse:
			$Spawners.queue_free()
			$Player.visible = false
			$GameOver.visible = true
			set_process(false)
		else:
			area.queue_free()


func _on_start_game_timeout():
	$Spawners.pause_mode = Node.PAUSE_MODE_PROCESS
	$Spawners.set_process(true)
func _on_victory():
	if Global.levels_completed < Global.current_level:
		Global.levels_completed = Global.current_level
	$Victory.visible = true
	victory = true


func _on_LevelSelect_pressed():
	get_tree().change_scene("res://levelselect.tscn")
	pass # Replace with function body.


func _on_NextLevel_pressed():
	get_tree().change_scene("res://levels/level"+str(Global.current_level+1)+"/"+"level"+str(Global.current_level+1)+".tscn")
	pass # Replace with function body.


func _on_TryAgain_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.
