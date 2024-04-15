extends Node2D

var summoningCircleTexture = load("res://assets/summoning_ring.png")

var summons : Array[Node2D]
var i = 0

func summon(ally):
	print("recieved ally ")
	if i < 3:
		
		summons.push_back(ally)
		add_child(ally)
		i+=1
		
