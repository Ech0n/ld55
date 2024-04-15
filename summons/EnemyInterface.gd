extends CharacterBody2D
@onready
var player = get_tree().get_nodes_in_group("player")[0] 

var speed : float = 0.0

var in_attack_range : bool = false
var curr_health : float = 0.0
var attack_cooldown : float = 0
var curr_attack_cooldown : float = 0
var damage : float = 0
var touching_player : bool = false
var is_ranged : bool = false
var thorns_damage : float = 0
var touching_monster : bool = false
var random_direction : Vector2 = Vector2.ZERO
var touching_mobs = []

@onready
var animSprite = $AnimatedSprite2D

@onready
var infoLabel = $InfoLabel

@onready
var particleManager = $particler


func _ready():
	animSprite.play("walk")


func update_sprite_animation():
	animSprite.play("walk")
	if (player.position.x - position.x < 0):
		animSprite.flip_h = true
	if player.position.x - position.x > 0:
		animSprite.flip_h = false


func attack_player(): # This has to be overriden in order to work for ranged enemies
	if curr_attack_cooldown == 0:
		player.take_damage(damage)
		curr_attack_cooldown = attack_cooldown
	else:
		curr_attack_cooldown -= 1


func _physics_process(delta):
	infoLabel.text = "Touching uwu: %d" % (1 if touching_monster else 0)
	infoLabel.position = Vector2(-50, -50)
	
	if player:
		if in_attack_range:
			attack_player()
			animSprite.play("attack")
		else:
			update_sprite_animation()
		
		if not touching_player and not (is_ranged and in_attack_range):
			if touching_monster:
				position += random_direction * 1.5
			position = position.lerp(player.position, delta * speed)
	
	if touching_player:
		player.take_damage(thorns_damage) 


func _on_detection_area_body_entered(body):
	if body.is_in_group("player"):
		player = body


func _on_detection_area_body_exited(body):
	if body.is_in_group("player"):
		player = null


func _on_attack_detection_area_body_entered(body):
	if body.is_in_group("player"):
		in_attack_range = true


func _on_attack_detection_area_body_exited(body):
	if body.is_in_group("player"):
		in_attack_range = false


func _on_touching_area_body_entered(body):
	if body.is_in_group("player"):
		touching_player = true
	elif body.is_in_group("enemy") and body.global_position.x > global_position.x:
		random_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
		touching_monster = true
		touching_mobs.append(body)

func _on_touching_area_body_exited(body):
	if body.is_in_group("player"):
		touching_player = false
	elif body.is_in_group("enemy"):
		if body in touching_mobs:
			touching_mobs.erase(body)
			touching_monster = false
		


func take_damage(damage : float):
	curr_health -= damage
	particleManager.restart()
	if curr_health <= 0:
		queue_free()


func sleep(seconds):
	await get_tree().create_timer(seconds).timeout 

