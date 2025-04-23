                                         
@tool
extends Control

@onready var katsdxhq = $Screen_Conversations
@onready var tkmkvqox = $Screen_Chat
@onready var wziideru = $Screen_Settings

@onready var fsegbdnf = $Header/HBoxContainer/ConversationsButton
@onready var xkxlrpli = $Header/ChatButton
@onready var czplkzyl = $Header/HBoxContainer/SettingsButton
@onready var mfrokmdd = $Header/ScreenText

@onready var xjhnotli = $ConversationManager
@onready var xkohxhwy = $APIManager

                                          
var yyolruxi : bool = false

                                                    
var xasbjfbv : bool = false

func _ready():
    zrmvsqxw(false)
    
                                       
    xkohxhwy.fjmblogx.connect(goxrfbnx)
    xkohxhwy.shaftxdb.connect(goxrfbnx)
    
                                   
    xkxlrpli.pressed.connect(vkcpdfko)
    czplkzyl.pressed.connect(llqjawku)
    fsegbdnf.pressed.connect(iyjfpfqs)
    
    var kvtzzprv = EditorInterface.get_editor_settings()
    
                                        
    var yksburwc = kvtzzprv.has_setting("gamedev_assistant/development_mode") and kvtzzprv.get_setting('gamedev_assistant/development_mode') == true    
    if yksburwc:
        kqcdcaat()
    
    if kvtzzprv.has_setting("gamedev_assistant/validated"):
        if kvtzzprv.get_setting("gamedev_assistant/validated") == true:
            vkcpdfko()
            zrmvsqxw(true)
                        
                                                             
            xkohxhwy.abitjwod(true)
            return
                                          
    elif !kvtzzprv.has_setting("gamedev_assistant/onboarding_shown"):
        kqcdcaat()
        kvtzzprv.set_setting("gamedev_assistant/onboarding_shown", true)
        
    gvvtdtoa(wziideru, "Settings")

func gvvtdtoa (ekvmjrop, lhnpalay):
    katsdxhq.visible = false
    tkmkvqox.visible = false
    wziideru.visible = false
    
                                                 
    ekvmjrop.visible = true
    ekvmjrop._on_open()
    
    mfrokmdd.text = lhnpalay
    
    xasbjfbv = ekvmjrop == tkmkvqox
    
                       
    xkohxhwy.ftevlpyf.emit()
    
                                                                
                                                           
                                       

func iyjfpfqs():
    gvvtdtoa(katsdxhq, "Conversations")

func vkcpdfko():
    xjhnotli.lptrsntb()
    gvvtdtoa(tkmkvqox, "New Conversation")
    tkmkvqox.hurflqmz()
    xkohxhwy.ftevlpyf.emit()

func llqjawku():
    if wziideru.visible:
        return
    
    gvvtdtoa(wziideru, "Settings")

func yiirnygt (cpyqzltq : Conversation):
    xjhnotli.ijycnznf(cpyqzltq.id)
    gvvtdtoa(tkmkvqox, "Chat")

func zrmvsqxw (yorldhta : bool):
    yyolruxi = yorldhta
    xkxlrpli.disabled = !yorldhta
    fsegbdnf.disabled = !yorldhta
    
                                                               
func goxrfbnx(cgwdpmpw, param2 = ""):
                                                                                       
                                                            
    
    var gqzflmsz = AcceptDialog.new()
    gqzflmsz.get_ok_button().text = "Close"
    
                                                                                 
    if cgwdpmpw is bool:
                                                             
        var aetfwcyv = cgwdpmpw
        var vsinmdrv = param2
        
                                                   
        if aetfwcyv:
            gqzflmsz.title = "GameDev Assistant Update"
            gqzflmsz.dialog_text = "An update is available! Latest version: " + vsinmdrv + ". Go to https://app.gamedevassistant.com to download it."
            add_child(gqzflmsz)
            gqzflmsz.popup_centered()
    else:
                                                           
        var fkhrzqec = cgwdpmpw
        gqzflmsz.title = "GameDev Assistant Update"
        gqzflmsz.dialog_text = fkhrzqec
        add_child(gqzflmsz)
        gqzflmsz.popup_centered()

func kqcdcaat():
    var vnhribcc = AcceptDialog.new()
    vnhribcc.title = "Welcome Aboard! 🚀"
    vnhribcc.dialog_text = "Welcome to GameDev Assistant by Zenva!\n\n🌟 To get started:\n1. Find the Assistant tab (next to Inspector, Node, etc, use arrows < > to find it)\n2. Enter your token in Settings\n3. Start a chat with the + button\n4. Switch between Chat and Agent mode to find your perfect workflow\n\n\nHappy gamedev! 🎮"
    vnhribcc.ok_button_text = "Close"
    vnhribcc.dialog_hide_on_ok = true
    add_child(vnhribcc)
    vnhribcc.popup_centered()

func cijtiqjc():
    return xjhnotli
