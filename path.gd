extends Path2D

@export
var torch : PackedScene


@export_range(100,300)
var activation_distance = 225


@export
var generate_torches : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if(generate_torches):
		for i in range(curve.point_count):
			var p = curve.get_point_position(i)
			print(p,i)
			var torch_instance = torch.instantiate()
			add_child(torch_instance)
			torch_instance.transform.origin = p


