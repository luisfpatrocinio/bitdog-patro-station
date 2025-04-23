extends EditorContextMenuPlugin

var rnilklkb: Control

func _init(sbxnwxob: Control):                                                
    rnilklkb = sbxnwxob

                                                                              
func mhjdwktu(odexnobm: PackedStringArray):
    add_context_menu_item("Add to Chat",hmbybwsx)
    add_context_menu_item("Explain Code",chdjzehc)

func chdjzehc(uopoxpiq: Node):
    if not (uopoxpiq is CodeEdit):
        return
    if uopoxpiq.has_selection():
        var xmeynmrj = uopoxpiq.get_selected_text()
        if xmeynmrj:            
                                                                                    
            if rnilklkb:  
                if not rnilklkb.is_open_chat:
                    print("Please open the chat to use this command")
                    return
                                                                    
                var fxynnbjb : TextEdit = rnilklkb.get_node("Screen_Chat/Footer/PromptInput")         
                if fxynnbjb:                                               
                    fxynnbjb.set_text("Explain the following code:\n\n " + xmeynmrj)             
                else:                                                               
                    print("PromptInput node not found in the dock.")                
            else:                                                                   
                print("Dock reference is null.")          

func hmbybwsx(rwqgwcva: Node):
    if not (rwqgwcva is CodeEdit):
        return
    if rwqgwcva.has_selection():
        var tptcwfmr = rwqgwcva.get_selected_text()
        if tptcwfmr:
                                                                                    
            if rnilklkb:          
                if not rnilklkb.is_open_chat:
                    print("Please open the chat to use this command")
                    return
                                                                      
                var ldgwchbr : TextEdit = rnilklkb.get_node("Screen_Chat/Footer/PromptInput")         
                if ldgwchbr:                                               
                    ldgwchbr.insert_text_at_caret(tptcwfmr)             
                else:                                                               
                    print("PromptInput node not found in the dock.")                
            else:                                                                   
                print("Dock reference is null.")          

            
            
            
