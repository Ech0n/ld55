extends Node2D

var summoningCircleTexture = load("res://assets/summoning_ring.png")

@onready
var player = get_tree().get_nodes_in_group("player")[0]

var summons : Array[Node2D]
var i = 0

func summon(ally):
	print("recieved ally ")
	if i <= 3:
		summons.push_back(ally)
		ally.position = player.position
		add_child(ally)
		var sumonCircle = Sprite2D.new()
		sumonCircle.texture = summoningCircleTexture
		sumonCircle.position = player.position
		add_child(sumonCircle)
		i+=1
		
