extends Node2D

@onready
var musicSfx = get_node("Music/PhaseMusic");

@onready
var phaseTime = get_node("PhaseTime");

@onready
var player = get_node("Player");

#=========================================

@onready
var timeLabel1 = get_node("TimeLabels/TimeLabel1");

@onready
var timeLabel2 = get_node("TimeLabels/TimeLabel2");

@onready
var timeLabel3 = get_node("TimeLabels/TimeLabel3");

@onready
var timeLabel4 = get_node("TimeLabels/TimeLabel4");

# Called when the node enters the scene tree for the first time.
func _ready():
	Utils.playerAlive = true;
	
	if Utils.playerPhase == 1:
		player.SPEED = 120.0;

	if Utils.playerPhase == 2:
		player.SPEED = 180.0;

	if Utils.playerPhase == 3:
		player.SPEED = 260.0;

	if Utils.playerPhase == 4:
		player.SPEED = 340.0;

	if Utils.playerPhase == 5:
		player.SPEED = 400.0;

	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);
	musicSfx.play();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timeLabel1.text = "00:00:" + str(roundf(phaseTime.time_left));
	timeLabel2.text = "00:00:" + str(roundf(phaseTime.time_left));
	timeLabel3.text = "00:00:" + str(roundf(phaseTime.time_left));
	timeLabel4.text = "00:00:" + str(roundf(phaseTime.time_left));
	
	if phaseTime.time_left <= 9:
		timeLabel1.text = "00:00:0" + str(roundf(phaseTime.time_left));
		timeLabel2.text = "00:00:0" + str(roundf(phaseTime.time_left));
		timeLabel3.text = "00:00:0" + str(roundf(phaseTime.time_left));
		timeLabel4.text = "00:00:0" + str(roundf(phaseTime.time_left));
	
	if Utils.playerAlive == false:
		musicSfx.stop();

func _on_phase_time_timeout():
	player.deathSfx.play();
	player.playerDeath = true;
	Utils.playerAlive = false;
	await get_tree().create_timer(player.deathSfx.stream.get_length()).timeout;
	get_tree().change_scene_to_file("res://Game Over/game_over.tscn");


func _on_fall_area_body_entered(body):
	if body.name == "Player":
		body.deathSfx.play();
		body.playerDeath = true;
		Utils.playerAlive = false;
		await get_tree().create_timer(body.deathSfx.stream.get_length()).timeout;
		get_tree().change_scene_to_file("res://Game Over/game_over.tscn");
