extends KinematicBody2D

func sprite(i):
	Ballcor = get_node("BallCor")
	if(i == 0):
		BallCor.set_region_rect(Rect2(128,192,128,128))
		
	if(i == 1):
		BallCor.set_region_rect(Rect2(256,192,128,128))
	pass
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
