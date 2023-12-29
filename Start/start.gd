extends Node2D

var customCursor = load("res://Assets/cursor.png");

@onready
var quitSelected01 = get_node("QuitSelected/OptionSelected");

@onready
var quitSelected02 = get_node("QuitSelected/OptionSelected2");

@onready
var optionSelected01 = get_node("OptionSelected/OptionSelected");

@onready
var optionSelected02 = get_node("OptionSelected/OptionSelected2");

@onready
var startSelected01 = get_node("StartSelected/OptionSelected");

@onready
var startSelected02 = get_node("StartSelected/OptionSelected2");

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(customCursor);
	
	quitSelected01.visible = false;
	quitSelected02.visible = false;
	
	optionSelected01.visible = false;
	optionSelected02.visible = false;
	
	startSelected01.visible = false;
	startSelected02.visible = false;

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Region Select/region_select.tscn");
	#get_tree().change_scene_to_file("res://Level Select/level_select.tscn");


func _on_config_button_pressed():
	pass;


func _on_exit_button_pressed():
	get_tree().quit();


func _on_quit_area_mouse_entered():
	quitSelected01.visible = true;
	quitSelected02.visible = true;

func _on_quit_area_mouse_exited():
	quitSelected01.visible = false;
	quitSelected02.visible = false;


func _on_option_area_mouse_entered():
	optionSelected01.visible = true;
	optionSelected02.visible = true;

func _on_option_area_mouse_exited():
	optionSelected01.visible = false;
	optionSelected02.visible = false;


func _on_area_2d_mouse_entered():
	startSelected01.visible = true;
	startSelected02.visible = true;

func _on_area_2d_mouse_exited():
	startSelected01.visible = false;
	startSelected02.visible = false;
