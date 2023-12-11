extends Node2D

@onready
var areaAnimation = get_node("AnimatedSprite2D");

@onready
var shrink = false;

@onready
var expand = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_mouse_entered():
	expand = true;
	shrink = false;
	areaAnimation.play("Selected");
	self.z_index = 1;
	
	while self.scale.x < 10:
		self.scale.x += 0.1;
		self.scale.y += 0.1;
		await get_tree().create_timer(0.2).timeout;
		
		if(shrink == true):
			shrink = false;
			expand = false;
			break;


func _on_area_2d_mouse_exited():
	shrink = true;
	expand = false;
	areaAnimation.stop();
	self.z_index = 0;
	
	while self.scale.x > 9:
		self.scale.x -= 0.1;
		self.scale.y -= 0.1;
		await get_tree().create_timer(0.1).timeout;
		
		if(expand == true):
			expand = false;
			shrink = false;
			break;
