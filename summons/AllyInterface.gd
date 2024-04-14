extends CharacterBody2D

@onready var player = get_tree().get_nodes_in_group("player")[0]
@export var Bullet : PackedScene

var speed : float = 0.0
var damage : float = 0.0
var attack_cooldown : float = 0.0
var curr_attack_cooldown : float = 0.0
var blocks_enemy_projectiles : bool = false
var looseness : float = 1.0
var projectile_amount : int = 1
var spread_angle : float = 0.0
var summon_slot : int  # DONT TOUCH

var dir : int = 1

@onready var animSprite = $AnimatedSprite2D


func _ready():
	player.add_summon(self)
	animSprite.play("idle")
	if blocks_enemy_projectiles:
		add_to_group("blocker")

func shoot():
	for i in range(projectile_amount):
		var bullet = Bullet.instantiate()
		bullet.damage = damage  
		add_child(bullet)
		var angle_offset = spread_angle * (i - (projectile_amount - 1) / 2.0)
		var direction = position.direction_to(get_global_mouse_position()).rotated(deg_to_rad(angle_offset))
		bullet.set_target(direction)


func _physics_process(delta):
	
	if player:
		dir = sign(player.velocity.x) if player.velocity.x != 0 else dir
		var offset_x = Vector2.LEFT * (dir * 15)
		var offset_y = Vector2.UP * 8
		var pos = player.position + offset_x + offset_y
		position = lerp(position, pos, delta * speed)
	
	# "damage != 0" is a check if ally can attack, for example GolemSummon has 0 dmg thus can't attack
	if Input.is_action_just_pressed("attack") and curr_attack_cooldown == 0 and damage != 0:
		shoot()
		curr_attack_cooldown = attack_cooldown
	
	if curr_attack_cooldown:
		curr_attack_cooldown -= 1
