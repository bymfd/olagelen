extends Node

signal Strength
signal Finish
signal Start
signal StopTime

var is_finishing: bool = false
var is_sound: bool = true
var next=""
var nextfile = "user://next.save"

func _ready():
	load_from_file()
	
	
	

func save_to_file(var nextscene):
	var file = File.new()
	print("save")
	file.open(nextfile, File.WRITE)
	file.store_var(nextscene, true)
	file.close()


func load_from_file():
	print("load")
	var file = File.new()
	if file.file_exists(nextfile):
		file.open(nextfile, File.READ)
		next = file.get_var(true)
		file.close()
	else:
		next="res://Levels/Level0.tscn"
		save_to_file("res://Levels/Level0.tscn")
		
