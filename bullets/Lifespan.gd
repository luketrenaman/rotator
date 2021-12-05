extends Control
export var life:float = 10.0
export var val:float = 5.0
onready var spawner = get_parent().get_node("Spawners")
signal game_over
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	connect("game_over",get_parent(),"_on_Lifespan_game_over")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fmod(float(life),1.0) < 0.1:
		$HBoxContainer/Label.text = str(floor(life))+".0s"
	else:
		$HBoxContainer/Label.text = str(floor(life*10)/10)+"s"
	if not spawner.ct == 0:
		life = life - delta
		if life < 0:
			pass
			life = 0
			$HBoxContainer/Label.add_color_override("font_color", Color("d20202"))
			$HBoxContainer/Label.set("custom_colors/font_color",Color("d20202"))
			emit_signal("game_over")
