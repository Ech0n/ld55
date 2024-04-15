extends Node2D

var arrowObj : Node2D

var trackingPoint : Vector2

var gpsArrow  = preload("res://gps_arrow.tscn").instantiate()

@export_range(100,300)
var activation_distance = 225

@onready
var player = get_tree().get_nodes_in_group("player")[0]


@onready
var gpsPath = player.get_node("gpsPath")

func _ready():
	add_child(gpsArrow)
	gpsArrow.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player.gpsDest:
		#if player.position.distance_to(trackingPoint) > activation_distance:
		var gpsPos = gpsPath.curve.get_closest_point(player.gpsDest - player.transform.origin ) + player.transform.origin
		gpsArrow.position  = gpsPos
		gpsArrow.look_at(player.gpsDest)
		#else:
			#gpsArrow.visible = false
		
