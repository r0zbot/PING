extends StaticBody2D

func _ready():
	pass

func Blue(i):
	var point
	if(i==1):
		point = get_node("BlueScore/Sprite")
	elif(i==2):
		point = get_node("BlueScore/Sprite1")
	elif(i==3):
		point = get_node("BlueScore/Sprite2")
	elif(i==4):
		point = get_node("BlueScore/Sprite3")
	elif(i==5):
		point = get_node("BlueScore/Sprite4")
	
	point.set_opacity(1)
	
func Red(i):
	var point
	if(i==1):
		point = get_node("RedScore/Sprite")
	elif(i==2):
		point = get_node("RedScore/Sprite1")
	elif(i==3):
		point = get_node("RedScore/Sprite2")
	elif(i==4):
		point = get_node("RedScore/Sprite3")
	elif(i==5):
		point = get_node("RedScore/Sprite4")
	
	point.set_opacity(1)
