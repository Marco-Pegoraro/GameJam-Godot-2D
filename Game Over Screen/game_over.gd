extends Node2D

var customCursor = load("res://Assets/cursor.png");

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
	
	Input.set_custom_mouse_cursor(customCursor);


func _on_replay_button_pressed():
	get_tree().change_scene_to_file("res://Levels/Level01/level_01.tscn");


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://Start/start.tscn");
