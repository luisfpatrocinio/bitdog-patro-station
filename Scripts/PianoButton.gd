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
	"L": KEY_L
}

func _ready() -> void:
	var _parent = get_parent();
	var _children = _parent.get_children();
	var _myInd = _children.find(self);
	
	toneFreq = 350 + _myInd * 100;
	
	
	var chars = ["A", "S", "D", "F", "G", "H", "J", "K", "L"];
	if _myInd < len(chars):
		myChar = chars.get(_myInd);
		print(myChar);
		myKey = key_map[myChar];
		canPlay = true;
	
	connect("pressed", playNote);
	
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
