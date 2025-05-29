extends Button

var ledIndex: int = 0;

var ledsRealIndex = [
	24, 23, 22, 21, 20,
	15, 16, 17, 18, 19,
	14, 13, 12, 11, 10,
	5, 6, 7, 8, 9,
	4, 3, 2, 1, 0
]

var lightOn: bool = false;

func _ready() -> void:
	var _children = get_parent().get_children();
	var _myInd = _children.find(self);
	ledIndex = ledsRealIndex[_myInd];
	connect("pressed", switchLed);
	refreshButton();
	
func switchLed() -> void:
	lightOn = !lightOn;
	var _turnCommand = "on " if lightOn else "off ";
	var _command = "led_matrix_" + _turnCommand + str(ledIndex);
	ConnectionManager.send_data(_command)
	refreshButton();

func refreshButton() -> void:
	var _newColor = Color.LIME if lightOn else Color.BLACK;
	var new_stylebox_normal = get_theme_stylebox("normal").duplicate();
	new_stylebox_normal.bg_color = _newColor;
	add_theme_stylebox_override("normal", new_stylebox_normal)
	add_theme_stylebox_override("hover", new_stylebox_normal)
