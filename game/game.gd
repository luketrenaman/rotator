extends Node2D
onready var SPAWNERS = get_node("Spawners")
onready var BULLETS = get_node("Spawners/bullets")
onready var PLAYER = get_node("Player")
var ticks = 5
var angle = 0
var tangle = 0
var victory = false
var bulletMax = 0
func _ready():
	AudioManager.change_song("Theme1")
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
	$GameOver/DeathCause.text = "Lifespan Timer Depleted"
	game_over(false)
func game_over(collider):
	AudioManager.punctuate_song("Theme1_defeat")
	if collider:
		match collider.type:
			Global.BTYPES.bullet:
				$GameOver/DeathCause.text = "Hit Basis Projectile"
			Global.BTYPES.orange:
				$GameOver/DeathCause.text = "Hit Origin Projectile"
			Global.BTYPES.bounder:
				$GameOver/DeathCause.text = "Hit Bounder Projectile"
			Global.BTYPES.tchild:
				$GameOver/DeathCause.text = "Hit Tunnel Projectile"
	if self.has_node("Lifespan"):
		get_node("Lifespan").set_process(false)
			
		
	var completion = floor(100-float(SPAWNERS.ct)/float(bulletMax)*100)
	if completion == 100:
		completion = 99
	$GameOver/Completion.text = str(completion)
	for child in $Spawners.get_children():
		if child.get_name() == "bullets" or child.get_name() == "Bounders":
			child.set_process(false)
			continue
		child.queue_free()
	#$Player.visible = false
	$GameOver.visible = true
	set_process(false)
func _on_Player_area_entered(area):
	if not victory:
		if not area.type == Global.BTYPES.inverse:
			game_over(area)
			$Spawners.set_process(false)
		else:
			$Lifespan.life += 5
			area.queue_free()

func _on_victory():
	if victory:
		return
	AudioManager.punctuate_song("Theme1_victory")
	if Global.levels_completed < Global.current_level:
		Global.levels_completed = Global.current_level
	$Victory.visible = true
	victory = true


func _on_LevelSelect_pressed():
	get_tree().change_scene("res://menus/levelselect.tscn")
	AudioManager.change_song("Menu")
	pass # Replace with function body.


func _on_NextLevel_pressed():
	Global.current_level += 1
	get_tree().change_scene("res://levels/level"+str(Global.current_level)+"/"+"level"+str(Global.current_level)+".tscn")
	
	pass # Replace with function body.


func _on_TryAgain_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.
