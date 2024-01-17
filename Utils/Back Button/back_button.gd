extends Node2D

@export
var windownBackRes = "";

@onready
var button = get_node("Button");

@onready
var spriteButton = get_node("Button/Sprite2D");

func _process(delta):
	if(button.is_hovered()):
		spriteButton.texture = load("res://Assets/Buttons/hover_select_button.png");
	else:
		spriteButton.texture = load("res://Assets/Buttons/select_button.png");


func _on_button_pressed():
	get_tree().change_scene_to_file(windownBackRes);
