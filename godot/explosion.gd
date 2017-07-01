extends Particles2D



func _ready():
	var timer = get_node("Timer")
	timer.start()
	pass

func setPart(i,n,u):
	self.set_global_pos(i)
	var xy = 0
	if(n.x == 0):
		if(n.y<0):
			xy = 180
	else:
		if(n.x == 1):
			xy = 90
		else:
			xy = 270
	self.set_param(0, xy)
	self.set_param(2,u*10)

func _on_Timer_timeout():
	self.queue_free()
	pass 
