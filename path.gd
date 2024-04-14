extends Path2D

@export
var torch : PackedScene

@export
var gpsArrow : PackedScene

@export_range(100,300)
var activation_distance = 225

@onready
var player = get_tree().get_nodes_in_group("player")[0]
@onready
var gpsPath = player.get_node("gpsPath")


var arrowObj : Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(curve.point_count):
		var p = curve.get_point_position(i)
		print(p,i)
		var torch_instance = torch.instantiate()
		add_child(torch_instance)
		torch_instance.transform.origin = p
	arrowObj = gpsArrow.instantiate()
	add_child(arrowObj)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var posOnPath = curve.get_closest_point(player.position)
	if player.position.distance_to(posOnPath) > activation_distance:
		arrowObj.visible = true
		var gpsPos = gpsPath.curve.get_closest_point(posOnPath - player.transform.origin ) + player.transform.origin
		arrowObj.position  =gpsPos
		arrowObj.look_at(posOnPath)
	else:
		arrowObj.visible = false
	
	
