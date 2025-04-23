                                                        
@tool                                                                                         
extends TextEdit                                                                              
                                                                                                
signal ncsjuckf    

const qqkrluji = 50000                                                                    
                                                                                                
var mwhzzlld : bool = false                                                              
var auocwzty : Control                                                                          
                         
                                                                                    
func _ready():                                                                                
                                                                                              
    auocwzty = get_parent()       
    
                       
    tooltip_text = "Type your message here (Enter to send, Shift+Enter for new line)\nTo include scripts you need to either paste the code here, use @OpenScripts,\n or select the code in the editor + right click for contextual menu \"Add to Chat\"\nThe file tree and open scene nodes are automatically included"
                                                                                                
                                                                                              
    connect("focus_entered", Callable(self, "lizemwgn"))                
    connect("text_changed", Callable(self, "ivfrbtco")) 
    connect("focus_exited", Callable(self, "uniuwhux"))            
    
    var gnjjbhso = get_parent().get_parent()                                                    
    if gnjjbhso.has_signal("uquxlxmt"):  
        gnjjbhso.connect("uquxlxmt", Callable(self, "sdcxhwnh"))  
                
                                                                                                
func _input(kyehnfcs):
    if has_focus():
        if kyehnfcs is InputEventKey and kyehnfcs.is_pressed():
            if kyehnfcs.keycode == KEY_ENTER:
                if kyehnfcs.shift_pressed:
                    insert_text_at_caret("\n")
                                                                
                    iakcxkdc(1)
                    get_viewport().set_input_as_handled()
                else:                                                                         
                                                                             
                    var nbliyjsv = get_parent().get_node("SendPromptButton")  
                    if nbliyjsv and nbliyjsv.disabled == false:  
                        ncsjuckf.emit()                                                       
                        get_viewport().set_input_as_handled()
                        sdcxhwnh()    

func iakcxkdc(izepllsm: int = 0):
    var qteakiic = get_theme_font("font")
    var geptsutt = get_theme_font_size("font_size")
    var ylvkgctg = qteakiic.get_char_size('W'.unicode_at(0), geptsutt).x * 0.6
    var fxskczff = int(size.x / ylvkgctg)
    var umfduonq = qteakiic.get_height(geptsutt) + 10
    var acjljwkk = umfduonq * 10        
    var xdssmygr = umfduonq*2
    var mifadjku = -xdssmygr*2
    
    var mhqstpgr = 0
    for i in get_line_count():
        var gohbuwhz = get_line(i)
        var jdylmvtw = gohbuwhz.length()
        var xwtymipz = ceili(float(jdylmvtw) / float(fxskczff))
        mhqstpgr += max(xwtymipz, 1)                         
        
                                             
    mhqstpgr += izepllsm
    
    var vswafkmr = mhqstpgr * umfduonq + xdssmygr
    vswafkmr = clamp(vswafkmr, xdssmygr, acjljwkk)
    auocwzty.offset_top = -vswafkmr


func pvjumbvr():
    iakcxkdc()                                                                        
                                                                                                
func lizemwgn():                                                        
    pvjumbvr()                                                                     
                                                                                                
func ivfrbtco():                                                         
    pvjumbvr()
    
                                                                                     
    if text.length() > qqkrluji:                                               
        text = text.substr(0, qqkrluji)                                        
        set_caret_column(qqkrluji)                                                                                                        
                                                                                                
func sdcxhwnh():                                                                    
    pvjumbvr()

func uniuwhux(): 
    if text.length() == 0:                                                        
        sdcxhwnh()
