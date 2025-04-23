extends CanvasLayer
class_name MainScreen

@onready var textPanel: Panel = get_node("TextPanel");
@onready var ledsPanel: Panel = get_node("LedsPanel");
@onready var infoPanel: Panel = get_node("InfoPanel");
@onready var analogPanel: Panel = get_node("AnalogPanel");

@onready var clientIPLabel: Label = infoPanel.container.get_node("ClientIPLabel");
@onready var statusLabel: Label = infoPanel.container.get_node("StatusLabel");

@onready var huembleRobot: CharacterBody2D = find_child("HuembleRobot");
@onready var spaceShip: CharacterBody2D = find_child("SpaceShip");

func _ready() -> void:
	ConnectionManager.connect("playerConnected", _onPlayerConnected);
	
func _onPlayerConnected(playerId: String):
	statusLabel.text = "Status: Connected"
	clientIPLabel.text = playerId;
	pass


func setStatus(_statusStr: String):
	infoPanel.container.get_node("StatusLabel").text = "Status: " + _statusStr;

func _process(delta: float) -> void:
	$DebugLabel.text = "Dict: \n";
	$DebugLabel.text += str(ConnectionManager.inputDict);

func updateStatusLabel():
	if len(ConnectionManager.peers) <= 0:
		var _statusLabel = infoPanel.container.get_node("StatusLabel") as Label;
		_statusLabel.text = "Waiting for BitDog..."

func _on_button_pressed() -> void:
	var _text: String = textPanel.container.get_node("TextEdit").text;
	print("Texto enviado: " + _text);
	ConnectionManager.send_data(_text);
