extends Node2D

@onready
var timer = $Timer

@onready
var player = get_tree().get_nodes_in_group("player")[0]

#import enemies
@export_category("enemies")
@export
var slajm : PackedScene

var screenRadius = 300

func rand_circle(radius):
	return Vector2.RIGHT.rotated(randf() * TAU) * sqrt(randf_range(pow(1 / radius, 2), 1)) * radius

func _ready():
	screenRadius = sqrt( (get_viewport().size.x **2) + (get_viewport().size.y **2) )/2
	 

var i = 0
func _on_timer_timeout():
	var p = rand_circle(screenRadius)
	var inst = slajm.instantiate()
	inst.position = player.position + p
	add_child(inst)
	
	
