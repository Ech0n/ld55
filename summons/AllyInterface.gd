extends CharacterBody2D

@export var player : CharacterBody2D
@export var Bullet : PackedScene

var speed : float = 0.0
var damage : float = 0.0
var attack_cooldown : float = 0.0
var curr_attack_cooldown : float = 0.0
var blocks_enemy_projectiles : bool = false
var looseness : float = 1.0

func _ready():
	if blocks_enemy_projectiles:
		add_to_group("blocker")

func shoot():
	var bullet = Bullet.instantiate()
	bullet.damage = damage
	add_child(bullet)
	bullet.set_target(position.direction_to(get_global_mouse_position()))


func _physics_process(delta):
	if player:
		var pos = player.position + (Vector2.LEFT * looseness * 15) + (Vector2.UP * looseness * 8)
		position = lerp(position, pos, delta * speed)
	
	if Input.is_action_just_pressed("attack") and curr_attack_cooldown == 0:
		shoot()
		curr_attack_cooldown = attack_cooldown
	
	if curr_attack_cooldown:
		curr_attack_cooldown -= 1
