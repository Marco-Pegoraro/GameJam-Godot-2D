extends Node2D

@onready
var button01 = get_node("ButtonLevel01");

@onready
var button02 = get_node("ButtonLevel02");

@onready
var button03 = get_node("ButtonLevel03");

@onready
var button04 = get_node("ButtonLevel04");

@onready
var button05 = get_node("ButtonLevel05");

#==============================================

@onready
var sprite01 = get_node("ButtonLevel01/Sprite2D");

@onready
var sprite02 = get_node("ButtonLevel02/Sprite2D");

@onready
var sprite03 = get_node("ButtonLevel03/Sprite2D");

@onready
var sprite04 = get_node("ButtonLevel04/Sprite2D");

@onready
var sprite05 = get_node("ButtonLevel05/Sprite2D");

var customCursor = load("res://Assets/cursor.png");

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(customCursor);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if button01.is_hovered():
		sprite01.texture = load("res://Assets/buttom_hover.png");
	else:
		sprite01.texture = load("res://Assets/buttom.png");
	
	#==============================================
	
	if button02.is_hovered():
		sprite02.texture = load("res://Assets/buttom_hover.png");
	else:
		sprite02.texture = load("res://Assets/buttom.png");
	
	#==============================================
	
	if button03.is_hovered():
		sprite03.texture = load("res://Assets/buttom_hover.png");
	else:
		sprite03.texture = load("res://Assets/buttom.png");
	
	#==============================================
	
	if button04.is_hovered():
		sprite04.texture = load("res://Assets/buttom_hover.png");
	else:
		sprite04.texture = load("res://Assets/buttom.png");
	
	#==============================================
	
	if button05.is_hovered():
		sprite05.texture = load("res://Assets/buttom_hover.png");
	else:
		sprite05.texture = load("res://Assets/buttom.png");


func _on_button_level_01_pressed():
	Utils.playerPhase = 1;
	get_tree().change_scene_to_file("res://Levels/Level01/level_01.tscn");


func _on_button_level_02_pressed():
	Utils.playerPhase = 2;
	get_tree().change_scene_to_file("res://Levels/Level01/level_01.tscn");


func _on_button_level_03_pressed():
	Utils.playerPhase = 3;
	get_tree().change_scene_to_file("res://Levels/Level01/level_01.tscn");


func _on_button_level_04_pressed():
	Utils.playerPhase = 4;
	get_tree().change_scene_to_file("res://Levels/Level01/level_01.tscn");


func _on_button_level_05_pressed():
	Utils.playerPhase = 5;
	get_tree().change_scene_to_file("res://Levels/Level01/level_01.tscn");
