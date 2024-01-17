extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		body.deathSfx.play();
		body.playerDeath = true;
		Utils.playerAlive = false;
		await get_tree().create_timer(body.deathSfx.stream.get_length()).timeout
		get_tree().change_scene_to_file("res://Game Over/game_over.tscn");
