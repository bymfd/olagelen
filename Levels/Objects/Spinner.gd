extends Area2D
var dene =Vector2()
export (int) var how_blackhole: = 1

func _on_BlackHole_body_entered(body):
	if body is Player:
		body.death()
func _ready():
	add_childspin()

func _process(delta)->void:
	spin(delta)

func spin(var how):
	$Node2D.rotate(how)

func add_childspin():
	for i in how_blackhole:
		var new = $Node2D/CollisionShape2D.duplicate(1)
		new.transform.origin.x+=dene.x+30
		dene.x+=30
		$Node2D.add_child(new)


func _on_Node2D_body_entered(body):
	if body is Player:
		body.death()
