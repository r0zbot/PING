extends YSort
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true)
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func _process(delta):
	ball = get_node("/root/Ball")
	ball.move(Vector2(2,0))
	pass
