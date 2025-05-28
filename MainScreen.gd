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

@onready var disconnectedBlock: Control = find_child("DisconnectedBlock");

func _ready() -> void:
	ConnectionManager.connect("playerConnected", _onPlayerConnected);
	disconnectedBlock.visible = true;
	
func _onPlayerConnected(playerId: String):
	statusLabel.text = "Status: Connected"
	clientIPLabel.text = playerId;
	pass


func setStatus(_statusStr: String):
	infoPanel.container.get_node("StatusLabel").text = "Status: " + _statusStr;

func _process(delta: float) -> void:
	$DebugLabel.text = "Dict: \n";
	$DebugLabel.text += str(ConnectionManager.inputDict);
	disconnectedBlock.modulate.a = move_toward(disconnectedBlock.modulate.a, 1.0 - float(ConnectionManager.connectionEstablished), 0.169);

func updateStatusLabel():
	if len(ConnectionManager.peers) <= 0:
		var _statusLabel = infoPanel.container.get_node("StatusLabel") as Label;
		_statusLabel.text = "Waiting for BitDog..."

func addTextOnScreen(text: String) -> void:
	var _label: Label = textPanel.container.get_node("TextScreen/Label");
	_label.text += text + "\n";
	
	var _lines = _label.text.split("\n") as Array;
	if _lines.size() > 7:
		_lines.pop_front();
		_label.text =  str("\n").join(_lines);

func _onSendCommandButtonPressed() -> void:
	var _textEdit = textPanel.container.get_node("TextEdit");
	var _text: String = _textEdit.text;
	addTextOnScreen(_text);
	_textEdit.text = "";
	
	ConnectionManager.send_data(_text);
