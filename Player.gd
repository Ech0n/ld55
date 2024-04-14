extends CharacterBody2D

@onready
var animSprite = $AnimatedSprite2D

@onready
var swordArea = $AnimatedSprite2D/swordArea

@onready
var playerColider = $colider

@onready
var healthLabel = $HealthLabel

@onready
var footstepsPartivcler = $footstepsParticles


var SPEED = 150.0

var attack_cooldown = 0.4
var max_health = 100.0
var curr_health = 100.0
var curr_attack_cooldown = 0
@export_range(1,200,1) var sword_damge = 35.0
var dmg_reduction = 1
@export var dash_distance = 100
@export var dashSpeed = 3
var dash_cooldown = 0.2
var curr_summons = []

var state = "idle"

func _ready():
	animSprite.play("idle")

func update_sprite_animation(xVelocity):
	#if animSprite.animation == "attack" or animSprite.animation == "dash":
		#return
		#
	animSprite.play("walk")
	footstepsPartivcler.emitting = true
	if xVelocity <0:
		animSprite.scale.x = -1
	if xVelocity >0:
		animSprite.scale.x = 1

var attackTimer = 100
var dashTimer = 100

var dashStartPos = 0
var dashDir = Vector2(1,0)
var lastDashPos: Vector2

func _physics_process(delta):
	var t = state
	var direction = Vector2( Input.get_axis("left", "right"), Input.get_axis("up","down"))
	var attack = Input.is_action_just_released("attack")
	footstepsPartivcler.emitting = false
	
	if(state=="idle"):
		animSprite.play("idle")
		if direction != Vector2.ZERO:
			state="walk"
		if attack:
			state="attack"
		if getDashInput():
			state="dash"
	if(state == "walk"):
		velocity = direction.normalized() * SPEED
		if velocity != Vector2.ZERO:
			update_sprite_animation(velocity.x)
			if attack:
				state="attack"
			if getDashInput():
				state="dash"
		elif attack:
			state="attack"
		elif getDashInput():
			state="dash"
		else:
			state = "idle"
	if(state == "attack"):
		velocity = direction.normalized() * SPEED
		if(attackTimer > attack_cooldown):
			animSprite.play("attack")
			attack()
			attackTimer = 0
	if(state == "dash"):
		velocity = dashDir.normalized() * SPEED * dashSpeed
		animSprite.play("dash")
		lastDashPos = position
		playerColider.disabled = true
		if position.distance_to(dashStartPos) > dash_distance:
			dashTimer = 0
			state = 'idle'
			animSprite.play("idle")
			velocity = Vector2.ZERO
			playerColider.disabled = false
	
	#if attack and curr_attack_cooldown == 0:
		
	
	if attackTimer < attack_cooldown:
		attackTimer +=delta
	if dashTimer < dash_cooldown:
		dashTimer +=delta
		
	move_and_slide()
	update_health_label()

func attack():
	var bodies = swordArea.get_overlapping_bodies()
	for b in bodies:
		if b.is_in_group("enemy"):
			b.take_damage(sword_damge)
		if b.is_in_group("enemyProjectile"):
			b.queue_free()

func update_health_label():
	healthLabel.text = "Health: %d" % curr_health
	healthLabel.position = Vector2(0, -50)

func getDashInput():
	if(dashTimer<dash_cooldown):
		return false
	var d = Input.is_action_just_pressed("dash")
	if d:
		dashDir = Vector2( Input.get_axis("left", "right"), Input.get_axis("up","down"))
		if dashDir == Vector2.ZERO:
			dashDir = Vector2(animSprite.scale.x,0)
		dashStartPos = position
	return d
	

func _on_animation_finished():
	state="idle"
	animSprite.play("idle")

var isInLava = false

func _on_pickup_area_body_entered(body):
	if body.has_method("random_items"):
		body.random_items()
	if body.is_in_group("env"):
		isInLava = true


func _on_pickup_area_body_exited(body):
	if body.is_in_group("env"):
		isInLava = false
	
var lavaTimer = 0.0
var nextLavaDmg = 5.0
func _process(delta):
	if(isInLava):
		lavaTimer += delta
		if lavaTimer > 0.5:
			lavaTimer = 0
			take_damage(nextLavaDmg)
			nextLavaDmg = nextLavaDmg**1.03
	else:
		nextLavaDmg = 10.0
		
		
		
func take_damage(damage):
	curr_health -= damage
	if curr_health < 0:
		pass # Death happens here

func delete_summon(summon):
	curr_summons.erase(summon)

func add_summon(summon):
	if len(curr_summons) == 3:
		return
	curr_summons.append(summon)
