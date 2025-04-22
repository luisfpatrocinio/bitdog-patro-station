extends CanvasLayer
class_name MainScreen

const PORT = 5000;
var server := UDPServer.new();
var peers: Array[PacketPeerUDP] = [];

@onready var textPanel: Panel = get_node("TextPanel");
@onready var ledsPanel: Panel = get_node("LedsPanel");
@onready var infoPanel: Panel = get_node("InfoPanel");
@onready var analogPanel: Panel = get_node("AnalogPanel");

@onready var clientIPLabel: Label = infoPanel.container.get_node("ClientIPLabel");
@onready var statusLabel: Label = infoPanel.container.get_node("StatusLabel");

@onready var huembleRobot: CharacterBody2D = find_child("HuembleRobot");
@onready var spaceShip: CharacterBody2D = find_child("SpaceShip");

func clearPeers() -> void:
	peers.clear();

func setStatus(_statusStr: String):
	infoPanel.container.get_node("StatusLabel").text = "Status: " + _statusStr;

func _ready() -> void:
	server.listen(PORT)

func managePacket(packet: String):
	var _pack = packet;
	
	var _firstChar = packet[0];
	match _firstChar:
		"A":
			print("packet original: " + str(packet));
			var _vector = packet.split_floats("|", false).slice(1);
			print(_vector);
			spaceShip.velX = _vector[0];
			spaceShip.velY = _vector[1];
			pass
			

	
func update_peers_and_packets() -> void:
	clientIPLabel.text = "";
	for i in range(0, peers.size()):
		var _thisPeer = peers[i];
		var _packet = _thisPeer.get_packet();
		clientIPLabel.text += "IP: " + _thisPeer.get_packet_ip() + "\n";
		if _packet:
			managePacket(_packet.get_string_from_utf8());

func updateStatusLabel():
	if len(peers) <= 0:
		var _statusLabel = infoPanel.container.get_node("StatusLabel") as Label;
		_statusLabel.text = "Waiting for BitDog..."

func _process(delta: float) -> void:
	server.poll();

	updateStatusLabel();

	# Receber novos clientes:
	if server.is_connection_available():
		var peer: PacketPeerUDP = server.take_connection()
		var packet := peer.get_packet()
		print("New peer connected: %s:%s" % [peer.get_packet_ip(), peer.get_packet_port()])
		print("Received data: %s" % [packet])
		setStatus("Connected");
		
		# Manage the received package
		managePacket(packet.get_string_from_utf8());
		
		peer.put_packet(str("connected").to_utf8_buffer());
		
		# Keep a reference so we can keep contacting the remote peer.
		peers.append(peer)
	else:
		clientIPLabel.text = "Desconectado"
		
		# Poll Received Packets
		update_peers_and_packets()

func send_data(message: String):
	for peer: PacketPeerUDP in peers:
		var _ip = peer.get_packet_ip()
		var _msg = message.to_utf8_buffer();
		print("Sending to %s | Message: %s" % [_ip, message])
		peer.put_packet(_msg);

func _on_button_pressed() -> void:
	var _text: String = textPanel.container.get_node("TextEdit").text;
	print("Texto enviado: " + _text);
	send_data(_text);
