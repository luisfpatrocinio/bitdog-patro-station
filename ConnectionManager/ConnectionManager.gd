extends Node

const PORT = 5000;
var server := UDPServer.new();
var peers: Array[PacketPeerUDP] = [];

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

func _ready() -> void:
	server.listen(PORT)
	
func _process(delta: float) -> void:
	server.poll();

func clearPeers() -> void:
	peers.clear();

func send_data(message: String):
	for peer: PacketPeerUDP in peers:
		var _ip = peer.get_packet_ip()
		var _msg = message.to_utf8_buffer();
		print("Sending to %s | Message: %s" % [_ip, message])
		peer.put_packet(_msg);
