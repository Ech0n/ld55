extends Node2D

@export 
var max_enemies = 20

@onready
var timer = $Timer

@onready
var player = get_tree().get_nodes_in_group("player")[0]

#import enemies
@export_category("enemies")
@export var enemies: Array[PackedScene]


var screenRadius = 300

func rand_circle(radius):
	return Vector2.RIGHT.rotated(randf() * TAU) * sqrt(randf_range(pow(1 / radius, 2), 1)) * radius

func _ready():
	screenRadius = sqrt( (get_viewport().size.x **2) + (get_viewport().size.y **2) )/2
	 


var i = 0
func _on_timer_timeout():
	if get_child_count() > max_enemies:
		print("not spawning more", get_child_count())
		return
	print("spawning more", get_child_count())
	
	var pickEnemy = enemies[randi() % enemies.size()]
	#var pickEnemy = enemies[0]
	var p = rand_circle(screenRadius)
	var inst = pickEnemy.instantiate()
	inst.position = player.position + p
	add_child(inst)
	
	
