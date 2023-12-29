extends CharacterBody2D


const JUMP_VELOCITY = -250.0;

var SPEED = 120.0;

var DASHSPEED = 200.0;

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

@onready 
var ghostTimer = get_node("GhostTimer");

@export
var ghostNode : PackedScene;

@onready
var dashing = false;

@onready
var canDash = true;

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() and dashing == false:
		velocity.y += gravity * delta;
	
	
	# Handle Dash Action and Animation
	if Input.is_key_pressed(KEY_K) and canDash == true:
		dashing = true;
		canDash = false;
		$DashTimer.start();
		$DashCooldown.start();
	
	if Input.is_key_pressed(KEY_C) and canDash == true:
		dashing = true;
		canDash = false;
		$DashTimer.start();
		$DashCooldown.start();
	
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY;
		playerAnimations.play("Jump");
		jumpSfx.play();
	
	# Handle Death animation
	if playerDeath == true:
		SPEED = 0;
		DASHSPEED = 0;
		playerAnimations.play("Death");
		await playerAnimations.animation_finished;
	
	# Handle Fall animation after player jumps
	if velocity.y > 0:
		playerAnimations.play("Fall");
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if dashing:
			playerAnimations.play("Dash");
			velocity.y = 0;
			velocity.x = direction * DASHSPEED;
		else:
			velocity.x = direction * SPEED;
		
		if velocity.y == 0 and dashing == false:
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
	
	
	move_and_slide();

#func _unhandled_input(event):
#	if event is InputEventKey:
#		if event.pressed and event.keycode == KEY_C:
#			print("CCC")


func add_ghost():
	var ghost = ghostNode.instantiate();
	ghost.set_property(position, $AnimatedSprite2D.scale);
	get_tree().current_scene.add_child(ghost);

func dash():
	ghostTimer.start();
	await playerAnimations.animation_finished;
	ghostTimer.stop();


func _on_ghost_timer_timeout():
	add_ghost();


func _on_dash_timer_timeout():
	dashing = false;


func _on_dash_cooldown_timeout():
	canDash = true;
