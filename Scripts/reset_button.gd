extends Button
@onready var mainScreen = get_tree().get_first_node_in_group("MainScreen") as MainScreen;

func _ready() -> void:
	connect("pressed", reset);
	
func reset() -> void:
	mainScreen.send_data("reset");
	mainScreen.clearPeers();
