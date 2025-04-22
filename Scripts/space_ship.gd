extends CharacterBody2D

var startPosition: Vector2;
@export var moveRange: float = 100.0;

func _ready() -> void:
	startPosition = position;

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 10;
	#print("Velocidade: ", velocity);
	
	if velocity.length() > 0:
		rotation = lerp_angle(rotation, velocity.angle(), 0.20);
	move_and_slide();
	
	# Limitar posição da nave
	position.x = clamp(position.x, startPosition.x - moveRange, startPosition.x + moveRange);
	position.y = clamp(position.y, startPosition.y - moveRange, startPosition.y + moveRange);
