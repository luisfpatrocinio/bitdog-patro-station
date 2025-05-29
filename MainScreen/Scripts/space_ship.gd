extends CharacterBody2D

var startPosition: Vector2;
@export var moveRange: float = 100.0;

func _ready() -> void:
	startPosition = position;
	ConnectionManager.buttonAPressed.connect(randomizeColor);
	ConnectionManager.playerConnected.connect(randomizeColor);

func _process(delta: float) -> void:
	if ConnectionManager.inputDict.get("buttonA"):
		pass

func _physics_process(delta: float) -> void:
	velocity = Vector2(ConnectionManager.inputDict.xAxis, ConnectionManager.inputDict.yAxis) * 10.0;
	
	if velocity.length() > 0:
		rotation = lerp_angle(rotation, velocity.angle(), 0.20);
	move_and_slide();
	
	# Limitar posição da nave
	position.x = clamp(position.x, startPosition.x - moveRange, startPosition.x + moveRange);
	position.y = clamp(position.y, startPosition.y - moveRange, startPosition.y + moveRange);
	
# Edit file: res://Scripts/space_ship.gd
func randomizeColor():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	# Generate random RGB values between 0.3 and 1.0 to avoid dark colors
	var r = rng.randf_range(0.3, 1.0)
	var g = rng.randf_range(0.3, 1.0)
	var b = rng.randf_range(0.3, 1.0)
	
	# Create color from components
	var new_color = Color(r, g, b)
	
	# Apply color
	modulate = new_color
