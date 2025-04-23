@tool
extends Node

                                        
                             
                               

signal xjxyfelt (conversation : Conversation)

                                                                    
signal qljqonmq
signal qlogqqvl

var icshlbsc : Array[Conversation]
var dravnnmg : Conversation

@onready var nodmxwcb = $"../APIManager"
@onready var pbgwxanx = $".."
@onready var ewryxvlo = $"../Screen_Conversations"

func _ready ():
    nodmxwcb.gvrlnhwm.connect(ayryzgnl)
    nodmxwcb.hbnhgtjd.connect(_on_send_message_received)
    
    nodmxwcb.aftyyapf.connect(gbawnrvo)
    nodmxwcb.fpefpohp.connect(yysjnukw)

func tvydfjcy () -> Conversation:
    lptrsntb()                                            

    var lwgrwqdy = Conversation.new()
    lwgrwqdy.id = -1                                       
    icshlbsc.append(lwgrwqdy)
    dravnnmg = lwgrwqdy
    return lwgrwqdy

func lptrsntb ():
    if dravnnmg != null:
        if dravnnmg.id == -1:                                    
            icshlbsc.erase(dravnnmg)
    
    dravnnmg = null

func kwvapyzk (nzghmtgy : Conversation):
    dravnnmg = nzghmtgy
    qlogqqvl.emit()

                                                                    
                                                                              
func gbawnrvo (aadqsyms):
    icshlbsc.clear()
    
    for conv_data in aadqsyms:
        var pkafsbal = Conversation.new()
        pkafsbal.id = int(conv_data["id"])
        pkafsbal.title = conv_data["title"]
        pkafsbal.favorited = conv_data["isFavorite"]
        icshlbsc.append(pkafsbal)
    
    qljqonmq.emit()

                                   
func ayryzgnl(plbgcyix: String):
    if dravnnmg == null:
                                           
        tvydfjcy()
    
                                                     
                                                    
                           
       
    dravnnmg.lqyaafbp(plbgcyix)

func _on_send_message_received(pqpbruhh: String, qmajbwhi: int):
    print("Received assistant message: ", {
        "conversation_id": qmajbwhi,
        "current_conv_id": dravnnmg.id if dravnnmg else "none",
        "content": pqpbruhh
    })
    if dravnnmg:
        if dravnnmg.id == -1:
                                                                    
            dravnnmg.id = qmajbwhi
        dravnnmg.hwypcvck(pqpbruhh)

                                                                                      
                                                                     
func ijycnznf (kexsfldd : int):
    nodmxwcb.get_conversation(kexsfldd)

                                                            
                                                 
func yysjnukw (twfqvmvo):
    var fhedzcse : Conversation
    var xzqployp = twfqvmvo["id"]
    xzqployp = int(xzqployp)
    
                                                
    for c in icshlbsc:
        if c.id == xzqployp:
            fhedzcse = c
            break
    
                                              
    if fhedzcse == null:
        fhedzcse = Conversation.new()
        fhedzcse.id = xzqployp
        fhedzcse.title = twfqvmvo["title"]
        icshlbsc.append(fhedzcse)
    
    fhedzcse.messages.clear()
    
                                                    
    for message in twfqvmvo["messages"]:
        if message["role"] == "user":
            fhedzcse.lqyaafbp(message["content"])
        elif message["role"] == "assistant":
            fhedzcse.hwypcvck(message["content"])
    
    fhedzcse.has_been_fetched = true
    kwvapyzk(fhedzcse)

func gqtzsyyp (ybsntyuw : Conversation, ukwcuioq : bool):
    nodmxwcb.ngdywheh(ybsntyuw.id)
    
    if ukwcuioq:
        ewryxvlo.mbmgzvww("Adding favorite...")
    else:
        ewryxvlo.mbmgzvww("Removing favorite...")

func vjolyaxe():
    return icshlbsc
    
func giyoxwty():
    return dravnnmg
    
func krnajhvg(ohndtbel: int):
    dravnnmg.id = ohndtbel
