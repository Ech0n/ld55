extends Control

@onready
var player = get_tree().get_nodes_in_group("player")[0]

func _ready():
	pass

func _on_item_list_item_selected(index):
	if index == 0:
		player.max_health += 10
		player.curr_health += 10
		print(player.max_health + " " + player.curr_health)
	else:
		player.SPEED += 30
		print(player.SPEED)
	visible = false
