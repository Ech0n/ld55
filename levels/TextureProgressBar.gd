extends TextureProgressBar

@onready
var player = get_tree().get_nodes_in_group("player")[0]
# Called when the node enters the scene tree for the first time.
func _ready():
	player.health_change.connect(update)
	update()
	

func update():
	value = player.curr_health * 100 / player.max_health


