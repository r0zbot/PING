extends KinematicBody2D

export var speed = 1

func _ready():
	set_process(true)
	pass

func _process(delta):
	
	if(Input.is_action_pressed("Move_1_Up")):
		move( Vector2(0,-speed) )
	
	if(Input.is_action_pressed("Move_1_Down")):
		move( Vector2(0,speed) )
	
	pass