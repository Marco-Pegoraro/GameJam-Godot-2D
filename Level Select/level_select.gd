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

@onready
var button06 = get_node("ButtonLevel06");

@onready
var button07 = get_node("ButtonLevel07");

@onready
var button08 = get_node("ButtonLevel08");

@onready
var button09 = get_node("ButtonLevel09");

@onready
var button10 = get_node("ButtonLevel10");

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

@onready
var sprite06 = get_node("ButtonLevel06/Sprite2D");

@onready
var sprite07 = get_node("ButtonLevel07/Sprite2D");

@onready
var sprite08 = get_node("ButtonLevel08/Sprite2D");

@onready
var sprite09 = get_node("ButtonLevel09/Sprite2D");

@onready
var sprite10 = get_node("ButtonLevel10/Sprite2D");

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
	
	#==============================================
	
	if button06.is_hovered():
		sprite06.texture = load("res://Assets/buttom_hover.png");
	else:
		sprite06.texture = load("res://Assets/buttom.png");
	
	#==============================================
	
	if button07.is_hovered():
		sprite07.texture = load("res://Assets/buttom_hover.png");
	else:
		sprite07.texture = load("res://Assets/buttom.png");
	
	#==============================================
	
	if button08.is_hovered():
		sprite08.texture = load("res://Assets/buttom_hover.png");
	else:
		sprite08.texture = load("res://Assets/buttom.png");
	
	#==============================================
	
	if button09.is_hovered():
		sprite09.texture = load("res://Assets/buttom_hover.png");
	else:
		sprite09.texture = load("res://Assets/buttom.png");
	
	#==============================================
	
	if button10.is_hovered():
		sprite10.texture = load("res://Assets/buttom_hover.png");
	else:
		sprite10.texture = load("res://Assets/buttom.png");


func _on_button_level_01_pressed():
	get_tree().change_scene_to_file("res://Levels/Level01/level_01.tscn");
