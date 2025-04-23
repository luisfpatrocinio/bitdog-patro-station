extends Node

## Porta UDP na qual o servidor irá escutar conexões.
const PORT = 5000;

## Instância do servidor UDP para receber conexões.
var server := UDPServer.new();

## Lista de peers conectados via UDP.
var peers: Array[PacketPeerUDP] = [];

## Dicionário que armazena o estado atual do input (eixos e botões).
var inputDict: Dictionary = {
	"xAxis": 0.0,
	"yAxis": 0.0,
	"buttonA": false,
	"buttonB": false,
}

signal playerConnected(playerId: String);
signal buttonAPressed;
signal buttonBPressed;

## Gerencia pacotes recebidos e atualiza o dicionário de inputs com base no tipo de pacote.
## Pacotes que começam com "A" contêm dados do analógico.
## Pacotes que começam com "B" indicam um botão pressionado.
func managePacket(packet: String):
	print("Packet: " + str(packet));
	var _firstChar = packet[0];
	match _firstChar:
		"A":
			var _vector = packet.split_floats("|", false).slice(1);
			inputDict.set("xAxis", _vector[0]);
			inputDict.set("yAxis", _vector[1]);
		"B":
			var _buttonId = int(packet.split_floats("|", false).slice(1)[0]);
			match _buttonId:
				0:	
					inputDict.set("buttonA", true);
					print("BUTTON PRESSED: A");
					emit_signal("buttonAPressed");
				1:	
					inputDict.set("buttonB", true);
					print("BUTTON PRESSED: B");
					emit_signal("buttonBPressed");

## Inicia o servidor para escutar conexões na porta especificada.
func _ready() -> void:
	server.listen(PORT)

## Limpa a lista de peers conectados.
func clearPeers() -> void:
	peers.clear();

## Reseta os botões no dicionário de input para `false`.
func resetButtons() -> void:
	inputDict.set("buttonA", false);
	inputDict.set("buttonB", false);

## Atualiza os peers conectados e processa pacotes recebidos de cada um.
func update_peers_and_packets() -> void:
	for i in range(0, peers.size()):
		var _thisPeer = peers[i];
		var _packet = _thisPeer.get_packet();
		if _packet:
			managePacket(_packet.get_string_from_utf8());

## Envia uma mensagem em string para todos os peers conectados.
func send_data(message: String):
	for peer: PacketPeerUDP in peers:
		var _ip = peer.get_packet_ip()
		var _msg = message.to_utf8_buffer();
		print("Sending to %s | Message: %s" % [_ip, message])
		peer.put_packet(_msg);

## Função chamada a cada frame. Lida com polling de rede, nova conexão de peers e atualização de pacotes.
func _process(delta: float) -> void:
	server.poll();
	resetButtons();

	# Verifica se há uma nova conexão de cliente
	if server.is_connection_available():
		var peer: PacketPeerUDP = server.take_connection()
		var packet := peer.get_packet()
		print("New peer connected: %s:%s" % [peer.get_packet_ip(), peer.get_packet_port()])
		
		# Processa o primeiro pacote recebido
		managePacket(packet.get_string_from_utf8());
		
		# Envia confirmação de conexão
		peer.put_packet(str("connected").to_utf8_buffer());
		send_data("connected");
		
		# Armazena o peer para comunicação futura
		peers.append(peer)
		
		emit_signal("playerConnected", peer.get_packet_ip());
	else:
		# Atualiza os pacotes recebidos dos peers existentes
		update_peers_and_packets()
