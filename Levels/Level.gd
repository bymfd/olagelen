extends Node2D
var poz=Vector2()
export (String, FILE, "*.tscn") var Next_scene
#export (PackedScene) var Next_scene_pack
var click_count=2
func _ready()->void:
	Event.is_finishing = false
	#Event is singleton
	Event.connect("Finish", self, "on_Finish")

func on_Finish()->void:
	#Function is triggered but scene is restarted instead of changing to supposed scene
	Event.is_finishing = true
	Event.save_to_file(Next_scene);
	get_tree().change_scene(Next_scene)
	#get_tree().change_scene_to(Next_scene_pack)


func _on_Button_pressed():
	#$Button.rect_position.x=poz.x+rand_range(200,210)
	poz.x=$Button.get_global_transform().origin.x+rand_range(10,20)
	$Button.rect_position.x=poz.x+rand_range(5,10)
	#poz.x=$Button.get_global_transform().origin.x+rand_range(10,20)
	poz.x=$Button.get_global_transform().origin.x+rand_range(10,20)
	if click_count-1!=0:
		click_count-=1
	else:
		$Button.visible=false
