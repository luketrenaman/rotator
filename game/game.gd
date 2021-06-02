extends Node2D
onready var SPAWNERS = get_node("Spawners")
onready var BULLETS = get_node("Spawners/bullets")
onready var PLAYER = get_node("Player")
enum BTYPES{bullet,inverse,orange,bounder}
var ticks = 5
var angle = 0
var tangle = 0
var victory = false
var bulletMax = 0
func _ready():
	if self.has_node("Lifespan"):
		get_node("Lifespan").set_process(true)
	bulletMax = SPAWNERS.ct
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
func _on_Lifespan_game_over():
	game_over()
func game_over():
	if self.has_node("Lifespan"):
		get_node("Lifespan").set_process(false)
	var completion = floor(100-float(SPAWNERS.ct)/float(bulletMax)*100)
	if completion == 100:
		completion = 99
	$GameOver/Completion.text = str(completion) + "% Complete"
	$Spawners.queue_free()
	$Player.visible = false
	$GameOver.visible = true
	set_process(false)
func _on_Player_area_entered(area):
	if not victory:
		if not area.type == BTYPES.inverse:
			game_over()
		else:
			$Lifespan.life += 5
			area.queue_free()

func _on_victory():
	if Global.levels_completed < Global.current_level:
		Global.levels_completed = Global.current_level
	$Victory.visible = true
	victory = true


func _on_LevelSelect_pressed():
	get_tree().change_scene("res://menus/levelselect.tscn")
	pass # Replace with function body.


func _on_NextLevel_pressed():
	get_tree().change_scene("res://levels/level"+str(Global.current_level+1)+"/"+"level"+str(Global.current_level+1)+".tscn")
	pass # Replace with function body.


func _on_TryAgain_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.
