extends Node2D

var originalSize := scale;

var growSize := Vector2(1.2, 1.2);

var alphaMin = 0;

var alphaMax = 1;

var alphaMutable = 0;

@onready
var parchment = get_node("../Parchment");

@onready
var areaText = get_node("../EastText");

var teste = false;

func _ready():
	parchment.set_self_modulate(Color(1, 1, 1, 0));
	areaText.set_self_modulate(Color(1, 1, 1, 0));

func _input(event):
	if event is InputEventMouseButton:
		if teste == true:
			get_tree().change_scene_to_file("res://Level Select/level_select.tscn");


func _on_area_2d_mouse_entered():
	await grow_area(growSize, .3);
	self.z_index = 1;
	teste = true;
	
	while alphaMutable < alphaMax:
		alphaMutable += 0.2;
		await get_tree().create_timer(0.03).timeout;
		parchment.set_self_modulate(Color(1, 1, 1, alphaMutable));
		areaText.set_self_modulate(Color(1, 1, 1, alphaMutable));


func _on_area_2d_mouse_exited():
	await grow_area(originalSize, .2);
	self.z_index = 0;
	teste = false;
	
	while alphaMutable > alphaMin:
		alphaMutable -= 0.2;
		await get_tree().create_timer(0.03).timeout;
		parchment.set_self_modulate(Color(1, 1, 1, alphaMutable));
		areaText.set_self_modulate(Color(1, 1, 1, alphaMutable));


func grow_area(endSize: Vector2, duration: float) -> void:
	var tween := create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT);
	
	tween.tween_property(self, 'scale', endSize, duration);
