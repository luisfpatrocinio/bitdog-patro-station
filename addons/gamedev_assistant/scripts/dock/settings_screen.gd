                                  
@tool
extends GDAScreenBase

var zktdgnis : Label
var bsktbeaq : LineEdit
var ihczkluo : CheckButton
var vwsfwtzt : Button
var mypckoxx : RichTextLabel
var ppchvyfz : RichTextLabel
var rqnbotzs : RichTextLabel
var gmgnwwhd : Button
var mzrnafki : LineEdit
var lffpyzfh : Button
var xfaqkadx : Button
var sxjyfzlv : String

const jwhtnqkg : String = "gamedev_assistant/hide_token"
const oeocssxp : String = "gamedev_assistant/validated"
const qtuxuebr : String = "gamedev_assistant/custom_instructions"

@onready var zomrxchm = $".."
@onready var bkkorslm = $"../APIManager"
@onready var tgxakwjn = $"VBoxContainer/CustomInput"
@onready var jdatfctj = $"VBoxContainer/SaveCustomButton"

var bldfualx : bool

func _ready ():
    bkkorslm.vwvuomtd.connect(_on_validate_token_received)
    bkkorslm.fjmblogx.connect(_on_check_updates_received)
    bkkorslm.shaftxdb.connect(khathxfa)
    
    mycomolk()
    
                                             
    ihczkluo.toggled.connect(pykeeaul)
    vwsfwtzt.pressed.connect(elyvcuro)
    lffpyzfh.pressed.connect(lawlpuyy)
    xfaqkadx.pressed.connect(pydbyazp)
    bsktbeaq.text_changed.connect(zeptuyso)
    jdatfctj.pressed.connect(vtklpszu)
    
    mypckoxx.visible = false
    ppchvyfz.visible = false
    rqnbotzs.visible = false
    
    var ltmdqlzs = EditorInterface.get_editor_settings()       
    
    ltmdqlzs.set_setting("gamedev_assistant/version_identifier", "K83JDH50H1")
    
    bldfualx = ltmdqlzs.has_setting("gamedev_assistant/development_mode") and ltmdqlzs.get_setting('gamedev_assistant/development_mode') == true    
    if not bldfualx:
        ltmdqlzs.set_setting("gamedev_assistant/endpoint", "https://app.gamedevassistant.com")
        sxjyfzlv = "gamedev_assistant/token"
    else:
        ltmdqlzs.set_setting("gamedev_assistant/endpoint", "http://localhost:3000")
        sxjyfzlv = "gamedev_assistant/token_dev"
        print("Development mode")
        
    bkkorslm.zxgifzjd()
    
                                                                         
                                                  
func mycomolk ():
    zktdgnis = $VBoxContainer/EnterTokenPrompt
    bsktbeaq = $VBoxContainer/Token_Input
    ihczkluo = $VBoxContainer/HideToken
    vwsfwtzt = $VBoxContainer/ValidateButton
    mypckoxx = $VBoxContainer/TokenValidationSuccess
    ppchvyfz = $VBoxContainer/TokenValidationError
    rqnbotzs = $VBoxContainer/TokenValidationProgress
    lffpyzfh = $VBoxContainer/AccountButton
    xfaqkadx = $VBoxContainer/UpdatesButton

func pykeeaul (karzrqbz):
    bsktbeaq.secret = karzrqbz
    
    var uajvfbil = EditorInterface.get_editor_settings()
    uajvfbil.set_setting(jwhtnqkg, ihczkluo.button_pressed)

func zeptuyso (ziajgvfu):
    if len(bsktbeaq.text) == 0:
        zktdgnis.visible = true
    else:
        zktdgnis.visible = false
    
    zomrxchm.zrmvsqxw(false)
    
    mypckoxx.visible = false
    ppchvyfz.visible = false
    rqnbotzs.visible = false
    
    var inioudfp = EditorInterface.get_editor_settings()
    inioudfp.set_setting(sxjyfzlv, bsktbeaq.text)

func elyvcuro ():
    vwsfwtzt.disabled = true
    mypckoxx.visible = false
    ppchvyfz.visible = false
    rqnbotzs.visible = true
    bkkorslm.wvlrtgys()

                                                        
func _on_validate_token_received (zlvevose : bool, cadfogwj : String):
    rqnbotzs.visible = false
    vwsfwtzt.disabled = false
    
    if zlvevose:
        mypckoxx.visible = true
        mypckoxx.text = "Token has been validated!"
        
        var ekcqochz = EditorInterface.get_editor_settings()
        ekcqochz.set_setting(oeocssxp, true)
        
        zomrxchm.zrmvsqxw(true)
    else:
        ppchvyfz.visible = true
        ppchvyfz.text = cadfogwj

                                                  
                                                  
func _on_open ():
    mycomolk()
    var zhgwsiwd = EditorInterface.get_editor_settings()
    
    if zhgwsiwd.has_setting(sxjyfzlv):
        bsktbeaq.text = zhgwsiwd.get_setting(sxjyfzlv)
    
    if zhgwsiwd.has_setting(jwhtnqkg):
        ihczkluo.button_pressed = zhgwsiwd.get_setting(jwhtnqkg)
    
    bsktbeaq.secret = ihczkluo.button_pressed
    
    if len(bsktbeaq.text) == 0:
        zktdgnis.visible = true
    else:
        zktdgnis.visible = false
        
    if zhgwsiwd.has_setting(qtuxuebr):
        tgxakwjn.text = zhgwsiwd.get_setting(qtuxuebr)

func lawlpuyy():
    OS.shell_open("https://app.gamedevassistant.com/profile")
    
func pydbyazp():
    mypckoxx.visible = false
    ppchvyfz.visible = false
    rqnbotzs.visible = true
    
    bkkorslm.abitjwod()

func _on_check_updates_received(webcpghp: bool, exuiplef: String):
    rqnbotzs.visible = false
    
    if webcpghp:
        mypckoxx.visible = true
        mypckoxx.text = "An update is available! Latest version: " + exuiplef + ". Click 'Manage Account' to download it."
    else:
        mypckoxx.visible = true
        mypckoxx.text = "You are already in the latest version"

func khathxfa(xjfzjxuf: String):
    rqnbotzs.visible = false
    ppchvyfz.visible = true
    ppchvyfz.text = xjfzjxuf

func vtklpszu():
    var zsylaxmj = EditorInterface.get_editor_settings()
    zsylaxmj.set_setting(qtuxuebr, tgxakwjn.text)
    mypckoxx.visible = true
    mypckoxx.text = "Custom instructions have been saved"
    
