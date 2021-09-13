extends Control

var next_scene 

var hover = false
var blend = 0
var blendSpeed = 0.04
var global
var share = null 
func _ready():
	if Engine.has_singleton("GodotShare"):
		share = Engine.get_singleton("GodotShare")
	next_scene= Event.next

func _on_Button_mouse_entered():
	hover = true

func _on_Button_mouse_exited():
	hover = false

func _process(delta):
	if hover:
		var color = $BG2.color
		var alpha = lerp(color.a, 1, blendSpeed)
		$BG2.color.a = alpha
	else:
		var color = $BG2.color
		var alpha = lerp(color.a, 0, blendSpeed*5)
		$BG2.color.a = alpha

func _on_Button_pressed():
	print(next_scene)
	get_tree().change_scene(next_scene)


func _on_CheckBox_pressed():
	Event.is_sound= !Event.is_sound
	if Event.is_sound:
		CheckBox.DRAW_PRESSED
	else:
		CheckBox.DRAW_NORMAL



func _on_Button2_pressed():
	share.shareText(" ", " ", "Hey olagelen oynarken çok eğleniyorum sende denemelisin https://bymfd.github.io/olagelen" )


func _on_Credit_pressed():
	$HTTPRequest.request("https://raw.githubusercontent.com/bymfd/bymfd.github.io/canli/see/credit")

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var data = body.get_string_from_utf8()
	$ConfirmationDialog/TextEdit.text=data
	print(data)
		
	$ConfirmationDialog.visible=true
