extends Node2D

@onready
var musicSfx = get_node("Music/PhaseMusic");

# Called when the node enters the scene tree for the first time.
func _ready():
	Utils.playerAlive = true;
	Utils.playerPhase = 5;
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);
	musicSfx.play();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Utils.playerAlive == false):
		musicSfx.stop();
