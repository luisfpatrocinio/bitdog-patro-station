extends Button
@export_enum("RED:0", "GREEN:1", "BLUE:2") var color;

var lightOn: bool = false;

func _ready() -> void:
	connect("pressed", switchLed);
	refreshButtonColor();
	
func switchLed() -> void:
	lightOn = !lightOn;
	var _colorStr = "";
	match color:
		0: _colorStr = "red";
		1: _colorStr = "green"
		2: _colorStr = "blue"
	var _command = "turn_led_" + _colorStr + " ";
	_command += "on" if lightOn else "off";
	refreshButtonColor();
	ConnectionManager.send_data(_command);
	

func refreshButtonColor():
	var _newColor: Color = Color.WHITE;
	match color:
		0: _newColor = Color.RED if lightOn else Color.DARK_RED;
		1: _newColor = Color.GREEN if lightOn else Color.DARK_GREEN;
		2: _newColor = Color.BLUE if lightOn else Color.DARK_BLUE;

	var new_stylebox_normal = get_theme_stylebox("normal").duplicate();
	new_stylebox_normal.bg_color = _newColor;
	add_theme_stylebox_override("normal", new_stylebox_normal)
	add_theme_stylebox_override("hover", new_stylebox_normal)
