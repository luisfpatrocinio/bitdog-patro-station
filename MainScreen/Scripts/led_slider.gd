extends VSlider

@export var colorRect: ColorRect;
@export_enum("RED:0", "GREEN:1", "BLUE:2") var color;
@export var ledButton: Button;

func _ready() -> void:
	connect("value_changed", setLedValue);
	
func setLedValue(val):
	var _ledId = "";
	match color:
		0: 
			_ledId = "red";
			colorRect.color.r = val / 255.0;
		1: 
			_ledId = "green";
			colorRect.color.g = val / 255.0;
		2: 
			_ledId = "blue";
			colorRect.color.b = val / 255.0;
	
	if val >= max_value:
		ledButton.lightOn = true;
		ledButton.refreshButtonColor();
	else:
		ledButton.lightOn = false;
		ledButton.refreshButtonColor();
	
	var _command = "set_led_" + _ledId + "_brightness " + str(int(val));
	ConnectionManager.send_data(_command);
