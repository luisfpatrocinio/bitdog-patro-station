extends Button

var ledIndex: int = 0;
var lightOn: bool = false;
@onready var mainScreen = get_tree().get_first_node_in_group("MainScreen") as MainScreen;

func _ready() -> void:
	connect("pressed", switchLed);
	
func switchLed() -> void:
	lightOn = !lightOn;
	mainScreen.send_data("turn_matrix_led")
