extends YSort
var cor = 1
var vetorx = Vector2(-7,0)
var vetory = Vector2(0,2)
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true)
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func _process(delta):
	var ball = get_node("Ball")
	ball.move(vetorx+vetory)
	if(ball.is_colliding()):
		if(ball.get_collider() == get_node("BarraVermelha") or ball.get_collider() == get_node("BarraAzul")):
			vetorx = -vetorx
			if(ball.get_collider_velocity() > Vector2(0,0)):
				vetory = vetory+Vector2(0,3)
			if(ball.get_collider_velocity() < Vector2(0,0)):
				vetory = vetory+Vector2(0,-3)
			if(vetory > Vector2(0,15)):
				vetory = Vector2(0,15)
			if(vetory < Vector2(0,-15)):
				vetory = Vector2(0,-15)
			if(cor==0):
				cor = 1
			else:
				cor = 0
			ball.sprite(cor)
		else:
			vetory = -vetory
	pass
