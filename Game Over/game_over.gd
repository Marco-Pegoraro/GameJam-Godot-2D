extends Node2D

var customCursor = load("res://Assets/cursor.png");

@onready
var buttonReplay = get_node("ReplayButton");

@onready
var spriteReplay = get_node("ReplayButton/Sprite2D");

@onready
var buttonMenu = get_node("MenuButton");

@onready
var spriteMenu = get_node("MenuButton/Sprite2D");

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
	
	Input.set_custom_mouse_cursor(customCursor);


func _process(delta):
	if(buttonReplay.is_hovered()):
		spriteReplay.texture = load("res://Assets/Buttons/hover_select_button.png");
	else:
		spriteReplay.texture = load("res://Assets/Buttons/select_button.png");
	
	if(buttonMenu.is_hovered()):
		spriteMenu.texture = load("res://Assets/Buttons/hover_select_button.png");
	else:
		spriteMenu.texture = load("res://Assets/Buttons/select_button.png");


func _on_replay_button_pressed():
	get_tree().change_scene_to_file("res://Levels/FirstTowerLevel/first_tower_level.tscn");


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://Start/start.tscn");
