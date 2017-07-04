extends YSort

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process_input(true)
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func _input(input):
	if input.is_action_pressed("start"):
		get_tree().change_scene("res://main.tscn")