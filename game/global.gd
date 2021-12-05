extends Node
var current_level = 0
var levels_completed = 0
var encore_unlocked = false
enum BTYPES{bullet,inverse,orange,bounder,tunnel,tchild}

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	load_game()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	save_game.store_line(to_json({"current_level":current_level,"levels_completed":levels_completed,"muted":AudioManager.muted,"encore_unlocked":encore_unlocked}))
	save_game.close()
func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.
	save_game.open("user://savegame.save", File.READ)
	var game_data = parse_json(save_game.get_line())
	levels_completed = game_data["levels_completed"]
	current_level = game_data["current_level"]
	AudioManager.muted = game_data["muted"]
	if "encore_unlocked" in game_data:
		encore_unlocked = game_data["encore_unlocked"]
	save_game.close()
