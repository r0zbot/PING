extends YSort
var cor = 1
var vetorx = Vector2(-10,0)
var vetory = Vector2(0,3)
var set = 0 #usado para determinar o tempo da bola parada
var rightcor = 0 #usado para ver se a bola foi lançada com a cor correta
var parada = 0 #usado para parar a roleta
var ball #a bola
var trail #o rastro da bola
var roleta #a roleta
var explosao #particulas
var score #placar
var pontosA = 0#putuação da barra Azul
var pontosV = 0#putuação da barra Vermelha

func setball(): #coloca a bola no meio 
	ball.set_global_pos(Vector2(512.5,300))
	set = 0
	rightcor = 0
	parada = 0
	roleta.roleta()

func throw(): #prepara a direçao da bola baseada na roleta
	var pos = roleta.getframe()
	roleta.stop()
	if(pos<0.4):
		vetorx = Vector2(-10,0)
		if(pos<0.1):
			vetory = Vector2(0,-14)
		elif(pos<0.2):
			vetory = Vector2(0,-4)
		elif(pos<0.3):
			vetory = Vector2(0,4)
		else:
			vetory = Vector2(0,14)
	else:
		vetorx = Vector2(10,0)
		if(pos<0.5):
			vetory = Vector2(0,14)
		elif(pos<0.6):
			vetory = Vector2(0,4)
		elif(pos<0.7):
			vetory = Vector2(0,-4)
		else:
			vetory = Vector2(0,-14)

func ballcollisions(): #verifica as colisoes da bola
	var boom = explosao.instance()
	boom.setPart(ball.get_global_pos()+vetorx+vetory,ball.get_collision_normal(),vetorx.length()+vetory.length())
	
	if(ball.get_collider() == get_node("BarraVermelha") or ball.get_collider() == get_node("BarraAzul")):
			vetorx = -vetorx
			
			if(ball.get_collider_velocity() > Vector2(0,0)):
				vetory = vetory+Vector2(0,randi()%5+3)
			if(ball.get_collider_velocity() < Vector2(0,0)):
				vetory = vetory+Vector2(0,-(randi()%5+3))
				
			if(vetory > Vector2(0,20)):
				vetory = Vector2(0,20)
			if(vetory < Vector2(0,-20)):
				vetory = Vector2(0,-20)
				
			if(ball.get_collider() == get_node("BarraVermelha")):
				cor = 1
				trail.set_color_ramp(load("res://red.tres"))
				boom.setColor(load("res://blue.tres"))
			else:
				cor = 0
				trail.set_color_ramp(load("res://blue.tres"))
				boom.setColor(load("res://red.tres"))
			ball.sprite(cor)
	else:
		vetory = -vetory
		if(cor==0):
			boom.setColor(load("res://blue.tres"))
		else:
			boom.setColor(load("res://red.tres"))
	add_child(boom)
	ball.move(vetorx+vetory)


func blink(): #troca a cor da bola
	if(cor == 0):
		cor = 1
	else:
		cor = 0
	ball.sprite(cor)


func _ready():
	ball = get_node("Ball")
	roleta = get_node("Roleta")
	explosao = load("res://explosion.tscn")
	trail = get_node("Ball/Particles2D")
	score = get_node("Score")
	randomize()
	setball()
	set_fixed_process(true)
	pass


func _fixed_process(delta):
	if(set < 1.35):
		set = set + 1*delta
		blink();
		if(set > 0.75 and parada == 0):
			parada = 1
			throw()
	else:
		if(rightcor == 0):
			roleta.parada()
			if(vetorx < Vector2(0,0)):
				ball.sprite(1)
				trail.set_color_ramp(load("res://red.tres"))
			else:
				ball.sprite(0)
				trail.set_color_ramp(load("res://blue.tres"))
			rightcor = 1
		ball.move(vetorx+vetory)
		if(ball.test_move(vetorx+vetory)):
			ballcollisions()
		if(ball.get_pos() > Vector2(1225,0)):
			pontosA = pontosA + 1
			score.pontos(pontosA, pontosV)
			if(pontosA == 5):
				get_tree().change_scene("res://AzulWin.tscn")
			setball()
		if(ball.get_global_pos() < Vector2(-200,0)):
			pontosV = pontosV + 1
			score.pontos(pontosA, pontosV)
			if(pontosV == 5):
				get_tree().change_scene("res://VermelhoWin.tscn")
			setball()
	pass
