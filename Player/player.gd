extends CharacterBody2D


const SPEED = 120.0;
const JUMP_VELOCITY = -250.0;

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity");

@onready
var playerDeath = false;

@onready
var playerAnimations = get_node("AnimationPlayer");

@onready
var jumpSfx = get_node("SoundEffects/JumpSfx");

@onready
var deathSfx = get_node("SoundEffects/DeathSfx");


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta;

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY;
		playerAnimations.play("Jump");
		jumpSfx.play();
	
	
	# Handle Death animation
	if playerDeath == true:
		playerAnimations.play("Death");
		await playerAnimations.animation_finished;
	
	
	# Handle Fall animation after player jumps
	if velocity.y > 0:
		playerAnimations.play("Fall");
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED;
		
		if velocity.y == 0:
			playerAnimations.play("Run");
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED);
		
		if velocity.y == 0:
			playerAnimations.play("Idle");
	
	
	# Control player animations directions
	# Use elif in case you want player sprite stay in same direction
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true;
	
	if direction == 1:
		get_node("AnimatedSprite2D").flip_h = false;
	
	
	move_and_slide()
