extends Node2D

var customCursor = load("res://Assets/cursor.png");

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(customCursor);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Level Select/level_select.tscn");


func _on_config_button_pressed():
	pass # Replace with function body.


func _on_exit_button_pressed():
	get_tree().quit();
