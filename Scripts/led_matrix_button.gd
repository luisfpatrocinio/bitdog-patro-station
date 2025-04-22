extends Button

var ledIndex: int = 0;
var lightOn: bool = false;

func _ready() -> void:
	connect("pressed", switchLed);
	
func switchLed() -> void:
	lightOn = !lightOn;
	ConnectionManager.send_data("turn_matrix_led")
