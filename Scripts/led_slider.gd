extends VSlider

@export var colorRect: ColorRect;
@export_enum("RED:0", "GREEN:1", "BLUE:2") var color;


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
		
	var _command = "set_led_" + _ledId + "_brightness " + str(int(val));
	ConnectionManager.send_data(_command);
