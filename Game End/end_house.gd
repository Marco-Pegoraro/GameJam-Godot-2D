extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		if(Utils.playerPhase == 1):
			Utils.phaseComplete01 = true;
		
		if(Utils.playerPhase == 2):
			Utils.phaseComplete02 = true;
		
		if(Utils.playerPhase == 3):
			Utils.phaseComplete03 = true;
		
		if(Utils.playerPhase == 4):
			Utils.phaseComplete04 = true;
		
		if(Utils.playerPhase == 5):
			Utils.phaseComplete05 = true;
		
		get_tree().change_scene_to_file("res://Level Select/level_select.tscn");
