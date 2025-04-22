extends Node

const PORT = 5000;
var server := UDPServer.new();
var peers: Array[PacketPeerUDP] = [];

func managePacket(packet: String):
	print("Packet: " + str(packet));
	var _firstChar = packet[0];
	match _firstChar:
		"A":
			var _vector = packet.split_floats("|", false).slice(1);
			
			var _xInputAction = InputEventAction.new();
			_xInputAction.action = "ui_left" if _vector[0] < 0 else "ui_right";
			print(_xInputAction.action)
			_xInputAction.pressed = abs(_vector[0]) > 0;
			Input.parse_input_event(_xInputAction);
			

func _ready() -> void:
	server.listen(PORT)

func clearPeers() -> void:
	peers.clear();

func update_peers_and_packets() -> void:
	for i in range(0, peers.size()):
		var _thisPeer = peers[i];
		var _packet = _thisPeer.get_packet();
		if _packet:
			managePacket(_packet.get_string_from_utf8());

func send_data(message: String):
	for peer: PacketPeerUDP in peers:
		var _ip = peer.get_packet_ip()
		var _msg = message.to_utf8_buffer();
		print("Sending to %s | Message: %s" % [_ip, message])
		peer.put_packet(_msg);

func _process(delta: float) -> void:
	server.poll();

	# Receber novos clientes:
	if server.is_connection_available():
		var peer: PacketPeerUDP = server.take_connection()
		var packet := peer.get_packet()
		print("New peer connected: %s:%s" % [peer.get_packet_ip(), peer.get_packet_port()])
		print("Received data: %s" % [packet])
		#setStatus("Connected");
		
		# Manage the received package
		managePacket(packet.get_string_from_utf8());
		
		peer.put_packet(str("connected").to_utf8_buffer());
		
		# Keep a reference so we can keep contacting the remote peer.
		peers.append(peer)
	else:
		#clientIPLabel.text = "Desconectado"
		
		# Poll Received Packets
		update_peers_and_packets()
