extends YSort
var cor = 1
var vetorx = Vector2(-10,0)
var vetory = Vector2(0,3)
var set = 0 #usado para determinar o tempo da bola parada
var rightcor = 0 #usado para ver se a bola foi lançada com a cor correta
var ball #a bola


func setball(): #coloca a bola no meio 
	ball.set_global_pos(Vector2(512.5,300))
	if(randi()%10 > 5 ):
		vetorx = Vector2(10,0)
		ball.sprite(0)
	else:
		vetorx = Vector2(-10,0)
		ball.sprite(1) 
	vetory = Vector2(0, (randi()%8-4)*3)
	set = 0
	rightcor = 0


func ballcollisions(): #verifica as colisoes da bola
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


func blink(): #troca a cor da bola
	if(cor == 0):
		cor = 1
	else:
		cor = 0
	ball.sprite(cor)


func _ready():
	ball = get_node("Ball")
	randomize()
	setball()
	set_fixed_process(true)
	pass


func _fixed_process(delta):
	if(set < 0.75):
		set = set + 1*delta
		blink();
	else:
		if(rightcor == 0):
			if(vetorx < Vector2(0,0)):
				ball.sprite(1)
			else:
				ball.sprite(0)
			rightcor = 1
		ball.move(vetorx+vetory)
		if(ball.test_move(vetorx+vetory)):
			ballcollisions()
		if(ball.get_pos() > Vector2(1225,0) or ball.get_global_pos() < Vector2(-200,0)):
			setball()
	pass
