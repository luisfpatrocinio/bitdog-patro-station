extends CharacterBody2D

@onready var mainScreen = get_tree().get_first_node_in_group("MainScreen") as MainScreen;
var velX: float;
var velY: float;

func _physics_process(delta: float) -> void:
	velocity = Vector2(velX * 10.0, velY * 10.0);
	move_and_slide();
	pass
	
