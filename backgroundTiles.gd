extends TileMap

@onready
var player = get_tree().get_nodes_in_group("player")[0]

func _process(delta):
	if (int(player.position.x) % 255) < 1:
		position.x = player.position.x
	#if (int(player.position.y) % 255) < 1:
		#position.y = player.position.y
