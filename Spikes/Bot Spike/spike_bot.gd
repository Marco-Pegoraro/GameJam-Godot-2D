extends Node2D

@onready
var player = get_node("../../Player");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		body.deathSfx.play();
		body.playerDeath = true;
		Utils.playerAlive = false;
		await get_tree().create_timer(body.deathSfx.stream.get_length()).timeout;
		get_tree().change_scene_to_file("res://Game Over Screen/game_over.tscn");
