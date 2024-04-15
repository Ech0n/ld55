extends Node2D

@onready
var gpsArrow : PackedScene = load("res://gps_arrow.tscn")

@onready
var wiz = $Wizard

@onready
var player = get_tree().get_nodes_in_group("player")[0]
@onready
var gpsPath = player.get_node("gpsPath")


var activation_distance = 350

var arrowObj : Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	arrowObj = gpsArrow.instantiate()
	add_child(arrowObj)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_instance_valid(wiz):
		var wizPos = wiz.position
		if player.position.distance_to(wizPos) > activation_distance:
			arrowObj.visible = true
			var gpsPos = gpsPath.curve.get_closest_point(wizPos - player.transform.origin ) + player.transform.origin
			arrowObj.position  =gpsPos
			arrowObj.look_at(wizPos)
		else:
			arrowObj.visible = false
		
