extends StaticBody2D
var sprite
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	randomize()
	sprite = get_node("Sprite/AnimationPlayer")
	pass

func roleta():
	sprite.play("roleta")
	sprite.advance(randi()%8)

func parada():
	sprite.play("Parada")

func getframe():
	return sprite.get_pos()

func stop():
	sprite.stop()