extends Button

func _ready() -> void:
	connect("pressed", reset);
	
func reset() -> void:
	ConnectionManager.send_data("reset");
	ConnectionManager.clearPeers();
