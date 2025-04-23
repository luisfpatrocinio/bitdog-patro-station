@tool
extends Button

@onready var newudqzn : Label = $PromptLabel
@onready var saskykyr : TextureButton = $FavouriteButton
@onready var vqolinwu : Button = $DeleteButton

@export var non_favourite_color : Color
@export var favourite_color : Color

var ktmcwdfo : Conversation
var vlaylgkj

func _ready():
    saskykyr.modulate = non_favourite_color
    
                                
    pressed.connect(mmilygul)
    vqolinwu.pressed.connect(hlceuvrs)
    saskykyr.pressed.connect(falrcyhf)

                                                 
func gncfgroi (ulojzvqp : Conversation, iwcuyqtu):
    ktmcwdfo = ulojzvqp
    vlaylgkj = iwcuyqtu
    newudqzn.text = ktmcwdfo.rksvylyi().replace("\n", "")                    
    iqbxbrnc()

                                                
func mmilygul():
    vlaylgkj.yiirnygt(ktmcwdfo)

                              
                                    
func hlceuvrs():
    $"../../..".pblphuas(self)

func falrcyhf():
                                                          
    var mdbrsiul = vlaylgkj.cijtiqjc()
    mdbrsiul.gqtzsyyp(ktmcwdfo, not ktmcwdfo.favorited)
    iqbxbrnc()

func iqbxbrnc ():
    if ktmcwdfo.favorited:
        saskykyr.modulate = favourite_color
    else:
        saskykyr.modulate = non_favourite_color

func get_conversation():
    return ktmcwdfo
