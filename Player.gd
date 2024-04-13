extends CharacterBody2D

@onready
var animSprite = $AnimatedSprite2D

const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Vector2( Input.get_axis("left", "right"), Input.get_axis("up","down"))
	velocity = direction.normalized() * SPEED
	
	if velocity and animSprite:
		animSprite.play("walk")
		if velocity.x <0:
			animSprite.flip_h = true
		if velocity.x >0:
			animSprite.flip_h = false
	else:
		animSprite.play("idle")

	move_and_slide()
