extends CharacterBody2D

@onready var mainScreen = get_tree().get_first_node_in_group("MainScreen") as MainScreen;
var velX: float;
var velY: float;
var startPosition: Vector2;
@export var moveRange: float = 100.0;

func _ready() -> void:
	startPosition = position;

func _physics_process(delta: float) -> void:
	velocity = Vector2(velX * 10.0, velY * 10.0);
	
	if velocity.length() > 0:
		rotation = lerp_angle(rotation, velocity.angle(), 0.20);
	move_and_slide();
	
	# Limitar posição da nave
	position.x = clamp(position.x, startPosition.x - moveRange, startPosition.x + moveRange);
	position.y = clamp(position.y, startPosition.y - moveRange, startPosition.y + moveRange);
