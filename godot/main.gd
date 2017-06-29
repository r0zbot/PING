extends YSort
var cor = 1
var vetorx = Vector2(-10,0)
var vetory = Vector2(0,3)
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func setball():
	var ball = get_node("Ball")
	ball.set_global_pos(Vector2(512.5,300))
	if(randi()%10 > 5 ):
		vetorx = Vector2(10,0)
		ball.sprite(0)
	else:
		vetorx = Vector2(-10,0)
		ball.sprite(1) 
	vetory = Vector2(0, (randi()%4-2)*3)

func _ready():
	randomize()
	setball()
	set_fixed_process(true)
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func _fixed_process(delta):
	var ball = get_node("Ball")
	ball.move(vetorx+vetory)
	if(ball.test_move(vetorx+vetory)):
		if(ball.get_collider() == get_node("BarraVermelha") or ball.get_collider() == get_node("BarraAzul")):
			vetorx = -vetorx
			
			if(ball.get_collider_velocity() > Vector2(0,0)):
				vetory = vetory+Vector2(0,randi()%5+1)
			if(ball.get_collider_velocity() < Vector2(0,0)):
				vetory = vetory+Vector2(0,-randi()%5+1)
				
			if(vetory > Vector2(0,20)):
				vetory = Vector2(0,20)
			if(vetory < Vector2(0,-20)):
				vetory = Vector2(0,-20)
				
			if(ball.get_collider() == get_node("BarraVermelha")):
				cor = 1
			else:
				cor = 0
			ball.sprite(cor)
		else:
			vetory = -vetory
		ball.move(vetorx+vetory)
	if(ball.get_pos() > Vector2(1225,0) or ball.get_global_pos() < Vector2(-200,0)):
		setball()
		
	pass
