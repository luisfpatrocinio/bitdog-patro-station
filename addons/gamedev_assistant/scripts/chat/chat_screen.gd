                                                       
@tool
extends GDAScreenBase

signal uquxlxmt

var smsjnkne : RichTextLabel = null

@onready var ogwgcixy : TextEdit = $Footer/PromptInput
@onready var ljcgldya : Button = $Footer/SendPromptButton
@onready var mraplrjb : Control = $Footer
@onready var bxwgmfuz : Control = $Body

@onready var ozznwdqa = $"../APIManager"
@onready var ohpqalog = $"../ActionManager"

var kfwpmrmv = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_UserPrompt.tscn")
var pabidnfx = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_ServerResponse.tscn")
var fnermujv = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_ErrorMessage.tscn")
const uhzvlhoj = preload("res://addons/gamedev_assistant/scripts/chat/markdown_to_bbcode.gd")
var wripbxaz = preload("res://addons/gamedev_assistant/scripts/chat/message_tagger.gd").new()
var opigxzii = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_CodeBlockResponse.tscn")
var fqclwkdk = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_CodeBlockUser.tscn")
var raqjbfgz = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_Spacing.tscn")

var tszwopwk := false
var elawhhdv: String = ""

var qxarusjr : String = ""
var dadogaww : String = ""
var jgjmbdcd : int = -1

@onready var glhsxwmg = $Body/MessagesContainer
@onready var dejfornl = $Body/MessagesContainer/ThinkingLabel
@onready var nbvzhild = $Bottom/AddContext
@onready var yztlvwvt : CheckButton = $Bottom/ReasoningToggle
@onready var mhrngwub = $Body/MessagesContainer/RatingContainer
@onready var ikmetkbz = $Bottom/Mode

@onready var lvtlknri = preload("res://addons/gamedev_assistant/dock/icons/stop.png")  
@onready var aghoubyo = preload("res://addons/gamedev_assistant/dock/icons/arrowUp.png")  

var hxksywvg = [
    "",
    " @OpenScripts ",
    " @Output ",
    " @Docs ",
    " @GitDiff ",
]

@onready var yktcqwds = $"../ConversationManager"

var waiting_nonthinking = "Thinking ⚡"
var waiting_thinking = "Reasoning ⌛ This could take multiple minutes"

var notice_actions_nonthinking = "Generating one-click actions ⌛ To skip, press ■"
var notice_actions_thinking = "Generating one-click actions ⌛ To skip, press ■"


func _ready ():
    ozznwdqa.hbnhgtjd.connect(pxvuxqgy)
    ozznwdqa.onmciohk.connect(wkjfwrzs)
    
    yktcqwds.qlogqqvl.connect(nrtzllvy)
    ogwgcixy.ncsjuckf.connect(yfttamlk)
    
                       
    ozznwdqa.fgzfdoib.connect(fttntpoj)
    ozznwdqa.weenvsvx.connect(njswhmcg)
    ozznwdqa.ltjatavb.connect(aazirdxh)
    ozznwdqa.srsylxgj.connect(gqjcdzmw)

    nbvzhild.item_selected.connect(olsfvlhg)    
    ljcgldya.pressed.connect(epdfxtkk)   
    
    mhrngwub.get_node("UpButton").pressed.connect(svujxwbr)
    mhrngwub.get_node("DownButton").pressed.connect(zdradbrk)
    mhrngwub.visible = false 

func _on_open ():
    ogwgcixy.text = ""
    dejfornl.visible = false
    mhrngwub.visible = false 
    ltigmxyl(false)
    jgplfthh()
    nbvzhild.selected = 0
    elawhhdv = ''
    

                                                            
func hurflqmz ():
    tszwopwk = true
    ltigmxyl(true)
    jgjmbdcd = -1
    mhrngwub.visible = false

func fttntpoj(jbtrxghe: String, miucrcff: int, mzxbuybi: int) -> void:
    if smsjnkne == null:
        smsjnkne = pabidnfx.instantiate()
        smsjnkne.bbcode_enabled = true
        glhsxwmg.add_child(smsjnkne)
        var vumltfys = raqjbfgz.instantiate()
        glhsxwmg.add_child(vumltfys)
        dejfornl.visible = false
        elawhhdv = jbtrxghe
        
        if mzxbuybi != -1:
            jgjmbdcd = mzxbuybi
    else:
        elawhhdv += jbtrxghe
        
                                                  
    smsjnkne.text = uhzvlhoj.ubcfcbbi(elawhhdv)
    
                                                                     
    if not smsjnkne.meta_clicked.is_connected(ucvrzgtr):  
        smsjnkne.meta_clicked.connect(ucvrzgtr)  
    
    if miucrcff > 0:
        yktcqwds.krnajhvg(miucrcff)

func aazirdxh(rmqsgwmu: int, tjwbqrai: int) -> void:
    if smsjnkne:
        smsjnkne.visible = false

                                                                
    ieqgpczs(elawhhdv, pabidnfx, glhsxwmg, opigxzii)
    
                              
    glhsxwmg.move_child(dejfornl, glhsxwmg.get_child_count() - 1)
    dejfornl.visible = true
    dejfornl.text = notice_actions_nonthinking

func njswhmcg(gmsxrmum: int, fujdfilc: int) -> void:
                                         
    if smsjnkne:
        smsjnkne.queue_free()
        smsjnkne = null
        
    dejfornl.visible = false
    
                                                    
    glhsxwmg.move_child(mhrngwub, glhsxwmg.get_child_count() - 1)
    mhrngwub.visible = fujdfilc > 0
    
                          
    var oqhzsutm = ohpqalog.ycriwrfx(elawhhdv, fujdfilc)
    ohpqalog.mtsbwqmw(oqhzsutm, glhsxwmg)

    elawhhdv = ""
    ltigmxyl(true)
    dejfornl.visible = false
    ljcgldya.icon = aghoubyo

func gqjcdzmw(fkebreoj: String):
    tbpdvymh(fkebreoj)
    ltigmxyl(true)
    dejfornl.visible = false
    smsjnkne = null
    ljcgldya.icon = aghoubyo

func epdfxtkk():  
    if ozznwdqa.ofhepacf():  
                                         
        ozznwdqa.ftevlpyf.emit()  
        
                                             
        if smsjnkne:
            smsjnkne.queue_free()
            smsjnkne = null
        
        ltigmxyl(true)  
        ljcgldya.icon = aghoubyo  
        
        if not dejfornl.visible:
                                                                        
            ieqgpczs(elawhhdv, pabidnfx, glhsxwmg, opigxzii)
        
        dejfornl.visible = false  
        
                                                   
        glhsxwmg.move_child(mhrngwub, glhsxwmg.get_child_count() - 1)
        mhrngwub.visible = jgjmbdcd > 0

    else:  
                                             
        dvhlrjuc()  

func dvhlrjuc():
                                                        
    ohpqalog.ryvnlncn()
    
    mhrngwub.visible = false
    
    jgjmbdcd = -1
    
    if len(ogwgcixy.text) < 1:
        return
    
    var bagcftuj = ogwgcixy.text

                                                        
    if bvwdrhms() or tszwopwk:
        bagcftuj += dadogaww
        qxarusjr = dadogaww
    
    tszwopwk = false

    if Engine.is_editor_hint():
        var fjccazex = Engine.get_singleton("EditorInterface")
        bagcftuj = wripbxaz.zssmpsqh(bagcftuj, fjccazex)
    
    var qgwfuadc = yztlvwvt.button_pressed
    var mvhbcrvt : int = ikmetkbz.selected
    var bkossrue : String
    
    if mvhbcrvt == 0:
        bkossrue = "CHAT"
    else:
        bkossrue = "AGENT"        
    
    ozznwdqa.sjthcloa(bagcftuj, qgwfuadc, bkossrue)
    qatolmrm(ogwgcixy.text)                               
    ltigmxyl(false)
    ogwgcixy.text = ""
    
    if qgwfuadc:
        dejfornl.text = waiting_thinking
    else:
        dejfornl.text = waiting_nonthinking
        
    dejfornl.visible = true
    glhsxwmg.move_child(dejfornl, glhsxwmg.get_child_count() - 1)
    
                                               
    uquxlxmt.emit()
    
func ltigmxyl (nyrzrnsg : bool):
    if nyrzrnsg:  
        ljcgldya.icon = aghoubyo  
    else:  
        ljcgldya.icon = lvtlknri  

func pxvuxqgy (eaexblml : String, toxjqycg : int):
    ghikoznv(eaexblml)
    ltigmxyl(true)
    dejfornl.visible = false

func wkjfwrzs (zikunyxi : String):
    tbpdvymh(zikunyxi)
    ltigmxyl(true)
    dejfornl.visible = false

func qatolmrm(lizbcroz: String):
                                                                               
    ieqgpczs(lizbcroz, kfwpmrmv, glhsxwmg, fqclwkdk)
    
    var uzvbjkqy = raqjbfgz.instantiate()
    glhsxwmg.add_child(uzvbjkqy)


func ghikoznv(hdzcubqm: String):
                                                                                
    ieqgpczs(hdzcubqm, pabidnfx, glhsxwmg, opigxzii)
    
    var ttkivlvc = raqjbfgz.instantiate()
    glhsxwmg.add_child(ttkivlvc)

func tbpdvymh (vkxfqgro : String):
    var yfcpsyaw = fnermujv.instantiate()
    glhsxwmg.add_child(yfcpsyaw)
    yfcpsyaw.text = vkxfqgro

func jgplfthh ():
    for node in glhsxwmg.get_children():
        if node == dejfornl or node == mhrngwub:
            continue
        node.queue_free()
    glhsxwmg.custom_minimum_size = Vector2.ZERO
    
    uquxlxmt.emit()

func nrtzllvy ():
    var pbulurzj = yktcqwds.giyoxwty()
    jgplfthh()
    
    for msg in pbulurzj.messages:
        if msg.role == "user":
            qatolmrm(msg.content)
        elif msg.role == "assistant":
            ghikoznv(msg.content)
    
    ltigmxyl(true)

func olsfvlhg(sthrpjqe: int):
    if sthrpjqe >= 0 and sthrpjqe < hxksywvg.size():
        ogwgcixy.text += " " + hxksywvg[sthrpjqe]
        nbvzhild.select(0)

func ucvrzgtr(nlzboprc):
    OS.shell_open(str(nlzboprc))

                                                
func zwynscez(ilfjfstv: String) -> String:
    
    var tasnxwob = RegEx.new()
                                 
    tasnxwob.compile("\\[gds_context\\](.|\\n)*?\\[/gds_context\\]")
    ilfjfstv = tasnxwob.sub(ilfjfstv, "", true)
    
                                       
    tasnxwob.compile("<internal_tool_use>(.|\\n)*?</internal_tool_use>")
    return tasnxwob.sub(ilfjfstv, "", true)
    
                                                
func xedediyi(oeboprbp: String) -> String:
        
    var bnccwexa = RegEx.new()
    bnccwexa.compile("\\[gds_actions\\](.|\\n)*?\\[/gds_actions\\]")
    return bnccwexa.sub(oeboprbp, "", true)

func znitixzw(jzyldftf: String):
    jzyldftf = jzyldftf.replace(notice_actions_nonthinking, '').replace(notice_actions_thinking, '').strip_edges()
    return jzyldftf
    
func ieqgpczs(jhspudap: String, gkhrucfp: PackedScene, czwadxob: Node, ymsojxrb: PackedScene) -> void:
    
    jhspudap = jhspudap.strip_edges()
    jhspudap = zwynscez(jhspudap)
    
                       
    var pdfrqppu = uhzvlhoj.rkmtdxdx(jhspudap)

    for block in pdfrqppu:
        if block["type"] == "text":
            var rhqpksmd = gkhrucfp.instantiate()
            rhqpksmd.bbcode_enabled = true
            czwadxob.add_child(rhqpksmd)
            
            var lkixuvjg = block["content"]
            
                                                      
            lkixuvjg = uhzvlhoj.ealgqrrv(lkixuvjg)
            lkixuvjg = uhzvlhoj.ujhlrxnt(lkixuvjg)
            lkixuvjg = lkixuvjg.strip_edges()
            
            rhqpksmd.text = lkixuvjg

                                 
            if not rhqpksmd.meta_clicked.is_connected(ucvrzgtr):
                rhqpksmd.meta_clicked.connect(ucvrzgtr)

        elif block["type"] == "code":
            var xkqpmyng = ymsojxrb.instantiate()
            czwadxob.add_child(xkqpmyng)
            xkqpmyng.text = block["content"]

                           
func bvwdrhms() -> bool:
                                                           
    var qlvskezs = Engine.get_singleton("EditorInterface") if Engine.is_editor_hint() else null
    var siswxhof = wripbxaz.pyqgexym("", qlvskezs)
    var xeanovzn = wripbxaz.inmplfea("", qlvskezs)
        
                                            
    dadogaww = "[gds_context]Current project context:[/gds_context]\n" + siswxhof + "\n" + xeanovzn
    
                                        
    return dadogaww != qxarusjr

                               
func yfttamlk() -> void:
    var zxzsexhc = not ozznwdqa.ofhepacf()
    if zxzsexhc:
        dvhlrjuc()
        
func svujxwbr():
    if jgjmbdcd > 0:
        ozznwdqa.nkhhfsaa(jgjmbdcd, 5)
        mhrngwub.visible = false                     

func zdradbrk():
    if jgjmbdcd > 0:
        ozznwdqa.nkhhfsaa(jgjmbdcd, 1)
        mhrngwub.visible = false
