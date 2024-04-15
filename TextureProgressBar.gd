extends TextureProgressBar

@onready
var player = get_tree().get_nodes_in_group("player")[0]

func _ready():
	player.health_change.connect(update)
	update()

func update():
	value = player.curr_health * 100/ player.max_health
	
