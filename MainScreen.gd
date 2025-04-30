extends CanvasLayer
class_name MainScreen

@onready var panelsArea: Control = get_node("PanelsArea");

@onready var textPanel: Panel = panelsArea.get_node("TextPanel");
@onready var ledsPanel: Panel = panelsArea.get_node("LedsPanel");
@onready var analogPanel: Panel = panelsArea.get_node("AnalogPanel");

@onready var infoPanel: Panel = panelsArea.get_node("InfoPanel");
@onready var clientIPLabel: Label = infoPanel.container.get_node("ClientIPLabel");
@onready var statusLabel: Label = infoPanel.container.get_node("StatusLabel");

@onready var spaceShip: CharacterBody2D = find_child("SpaceShip");

func _ready() -> void:
	ConnectionManager.connect("playerConnected", _onPlayerConnected);
	ConnectionManager.godotinho = get_node("Godotinho");
	
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

func _onSendCommandButtonPressed() -> void:
	var _text: String = textPanel.container.get_node("TextEdit").text;
	print("Comando enviado: " + _text);
	var _label: Label = textPanel.container.get_node("TextScreen/Label");
	_label.text += _text + "\n";
	ConnectionManager.send_data(_text);
