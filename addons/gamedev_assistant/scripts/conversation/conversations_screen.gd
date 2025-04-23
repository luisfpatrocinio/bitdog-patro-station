@tool
extends GDAScreenBase

@onready var xwquhykd : ConfirmationDialog = $DeleteConfirmation
@onready var bdvkmdbs = $ScrollContainer/VBoxContainer
@onready var xrpjgdhm = $"../ConversationManager"

@onready var miqftrpp = $ScrollContainer/VBoxContainer/ErrorMessage
@onready var asarxjge = $ScrollContainer/VBoxContainer/ProcessMessage
@onready var nyxukgyv = $ScrollContainer/VBoxContainer/AllConversationsHeader
@onready var hzlfsbbi = $ScrollContainer/VBoxContainer/FavouritesHeader

var anheooxm = preload("res://addons/gamedev_assistant/dock/scenes/ConversationSlot.tscn")

var usyfwdxf
@onready var irhuzsbq = $".."

@onready var uzezpzji = $"../APIManager"

var daamxfgr : bool = false

func _ready ():
    xrpjgdhm.qljqonmq.connect(czvjhbdu)
    uzezpzji.yfmksvsf.connect(cbhsilis)
    uzezpzji.ipwuqykf.connect(_on_delete_conversation_received)
    uzezpzji.nrscnyoq.connect(cbhsilis)
    uzezpzji.lklgifyd.connect(cbhsilis)
    uzezpzji.dcfkdnwu.connect(_on_toggle_favorite_received)
    xwquhykd.confirmed.connect(lnlklhai)
    
func _on_open ():
    iqwsjjqn()
    uzezpzji.tdupyxtf()
    
                               
    
                                      
                                         
                                     

func iqwsjjqn ():
    for node in bdvkmdbs.get_children():
        if node is RichTextLabel:
            continue
        
        node.queue_free()
    
    miqftrpp.visible = false
    asarxjge.visible = false

func czvjhbdu ():
    iqwsjjqn()
    
    var fvrongjz = xrpjgdhm.vjolyaxe()
    
    var iiaslpzi : Array[Conversation] = []
    var yaorufae : Array[Conversation] = []
    
    for conv in fvrongjz:
        if conv.favorited:
            iiaslpzi.append(conv)
        else:
            yaorufae.append(conv)
    
    var ytyliflm = 2
    bdvkmdbs.move_child(hzlfsbbi, 1)
    
    for fav in iiaslpzi:
        var hphfhczz = fgxibrac(fav, irhuzsbq)
        bdvkmdbs.move_child(hphfhczz, ytyliflm)
        ytyliflm += 1
    
    bdvkmdbs.move_child(nyxukgyv, ytyliflm)
    ytyliflm += 1
    
    for other in yaorufae:
        var hphfhczz = fgxibrac(other, irhuzsbq)
        bdvkmdbs.move_child(hphfhczz, ytyliflm)
        ytyliflm += 1

func fgxibrac (ksgwuqsa, rvctosxp) -> Control:
    var hjvwdfba = anheooxm.instantiate()
    bdvkmdbs.add_child(hjvwdfba)
    hjvwdfba.gncfgroi(ksgwuqsa, rvctosxp)
    return hjvwdfba

                                            
                                        
func pblphuas (clilxrdi):
    usyfwdxf = clilxrdi
    xwquhykd.popup()

                                                        
func lnlklhai():
    if usyfwdxf == null or usyfwdxf.get_conversation() == null:
        return
    
    var chedoxal = usyfwdxf.get_conversation()
    uzezpzji.wcykpreh(chedoxal.id)
    
    mbmgzvww("Deleting conversation...")

func _on_toggle_favorite_received ():
    uzezpzji.tdupyxtf()

func _on_delete_conversation_received ():
    uzezpzji.tdupyxtf()

func mbmgzvww (aqhhzras : String):
    return
    
    bdvkmdbs.move_child(asarxjge, 1)
    miqftrpp.visible = false
    asarxjge.visible = true
    asarxjge.text = aqhhzras

func cbhsilis (abfbhoei : String):
    bdvkmdbs.move_child(miqftrpp, 0)
    asarxjge.visible = false
    miqftrpp.visible = true
    miqftrpp.text = abfbhoei
