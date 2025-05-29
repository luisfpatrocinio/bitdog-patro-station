extends Button

@export var toneFreq: int;
var myChar: String = "";
var myKey = KEY_A;
var canPlay = false;
var wasKeyPressed = false;

var playedTimer: float = 0.0;

var key_map = {
	"A": KEY_A,
	"S": KEY_S,
	"D": KEY_D,
	"F": KEY_F,
	"G": KEY_G,
	"H": KEY_H,
	"J": KEY_J,
	"K": KEY_K,
	"L": KEY_L,
	";": KEY_SEMICOLON,  # Exemplo de uma nova tecla
	"'": KEY_APOSTROPHE  # Outra tecla adicional
}

var isDown: bool = false;

func _ready() -> void:
	var _parent = get_parent()
	var _children = _parent.get_children()
	var _myInd = _children.find(self)
	
	toneFreq = 350 + _myInd * 100
	
	var chars = ["A", "S", "D", "F", "G", "H", "J", "K", "L", ";", "'"]
	var freqs = [132, 148, 165, 176, 198, 220, 247, 262, 294, 330, 349]
	
	for freqInd in range(len(freqs)):
		freqs[freqInd] = freqs[freqInd] * 4;
	
	if _myInd < len(chars):
		myChar = chars.get(_myInd);
		myKey = key_map[myChar];
		toneFreq = freqs[_myInd % len(freqs)];
		canPlay = true;
	
	connect("button_down", playNote);
	
	adjustColor();
	
func adjustColor():
	var _newColor = Color.WHITE;
	var new_stylebox_normal = get_theme_stylebox("normal").duplicate();
	new_stylebox_normal.bg_color = _newColor;
	add_theme_stylebox_override("normal", new_stylebox_normal)
	add_theme_stylebox_override("hover", new_stylebox_normal)
	
func _process(delta: float) -> void:
	playedTimer = move_toward(playedTimer, 0, 1);
	var _isKeyPressed = Input.is_key_pressed(myKey) && canPlay;
	
	if _isKeyPressed and not wasKeyPressed:
		#grab_focus();
		playNote();
		playedTimer = 30.0;
		
	wasKeyPressed = _isKeyPressed;
	
	# Colorir
	modulate.a = 1.0 - playedTimer/30.0;

func playNote():
	var _command = "play_tone " + str(toneFreq);
	ConnectionManager.send_data(_command);
