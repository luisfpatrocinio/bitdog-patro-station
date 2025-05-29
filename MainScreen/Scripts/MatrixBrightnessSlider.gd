extends HSlider

func _ready() -> void:
	connect("value_changed", changeValue);
	
func changeValue(val):
	var _command = "led_matrix_brightness " + str(int(max_value - val));
	ConnectionManager.send_data(_command);
