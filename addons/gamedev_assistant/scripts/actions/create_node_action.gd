                                                                 
@tool
extends Node

const xrmkvenr = preload("action_parser_utils.gd")
const qdftskzm = preload("edit_node_action.gd")

static func execute(efdnmomo: String, hrvazigd: String, xxrbwtzj: String, yjbqzzmd: String, wuazothk: Dictionary = {}) -> bool:
    var ezyvagws = EditorPlugin.new().get_editor_interface()
    var zekyyzlj = ezyvagws.get_open_scenes()
    
                                                               
    for scene in zekyyzlj:  
        if scene == xxrbwtzj:  
            print("Adding to open scene: ", scene)  
            ezyvagws.reload_scene_from_path(xxrbwtzj)
            return svanbwem(efdnmomo, hrvazigd, ezyvagws.get_edited_scene_root(), yjbqzzmd, wuazothk)  

                                                                                                       
    print("Adding to closed scene: ", xxrbwtzj)  
    return nmyalyjk(efdnmomo, hrvazigd, xxrbwtzj, yjbqzzmd, wuazothk)  

static func svanbwem(unzsiwoe: String, nmgsoupx: String, eykytgea: Node, caogvsei: String, gxbxbhww: Dictionary = {}) -> bool:
    if !ClassDB.class_exists(nmgsoupx): 
        push_error("Node %s doesnt exist" % [nmgsoupx])
        return false
    var hhzqlnwy = ClassDB.instantiate(nmgsoupx)
    hhzqlnwy.name = unzsiwoe
    
                                                         
    var xyvdbgax = eykytgea if (caogvsei.is_empty() or caogvsei == eykytgea.name) else eykytgea.find_child(caogvsei, true, true)  
    if not xyvdbgax:  
        if caogvsei == eykytgea.name:  
            xyvdbgax = eykytgea  
        else:  
            return false  
    
    xyvdbgax.add_child(hhzqlnwy)    
    hhzqlnwy.set_owner(eykytgea)
    
                                
    if not gxbxbhww.is_empty():
        if not qdftskzm.aptetnkv(hhzqlnwy, gxbxbhww, eykytgea):
            return false
    
                                                    
    return EditorInterface.save_scene() == OK

static func nmyalyjk(tkojzzdf: String, aprglnhx: String, bmokhpwg: String, ynasnnca: String, hnrdyuje: Dictionary = {}) -> bool:
    var lysrhclx = load(bmokhpwg)
    if !lysrhclx is PackedScene: return false
    
    var bzwryciw = lysrhclx.instantiate()
    var llsbhyjy = ClassDB.instantiate(aprglnhx)
    llsbhyjy.name = tkojzzdf
    
                                                         
    var qkctaqzk = bzwryciw if (ynasnnca.is_empty() or ynasnnca == bzwryciw.name) else bzwryciw.find_child(ynasnnca, true, true)  
    if not qkctaqzk:  
        if ynasnnca == bzwryciw.name:  
            qkctaqzk = bzwryciw  
        else:  
            return false  
    
    qkctaqzk.add_child(llsbhyjy)
    llsbhyjy.set_owner(bzwryciw)
    
                                
    if not hnrdyuje.is_empty():
        if not qdftskzm.aptetnkv(llsbhyjy, hnrdyuje, bzwryciw):
            return false
    
                                                          
    lysrhclx.pack(bzwryciw)

    return ResourceSaver.save(lysrhclx, bmokhpwg) == OK

static func parse_line(opqefekc: String, rrbteijs: String) -> Dictionary:
    if opqefekc.begins_with("create_node("):
                                                                              
        var azwyxovr = xrmkvenr.nygpmfqr(opqefekc)
        if azwyxovr.size() < 3:
            return {}
        
                                                                 
        var jwzzhknd = {}
        var ugfljsfc = opqefekc.find("{")
        var socnflbo = opqefekc.rfind("}")
        
        if ugfljsfc != -1 and socnflbo != -1:
            var nvaeltoc = opqefekc.substr(ugfljsfc, socnflbo - ugfljsfc + 1)
            jwzzhknd = xrmkvenr.qcvmtljn(nvaeltoc)
        
        return {
            "type": "create_node",
            "name": azwyxovr[0],
            "node_type": azwyxovr[1],
            "scene_path": azwyxovr[2],
            "parent_path": azwyxovr[3] if azwyxovr.size() > 3 else "",
            "modifications": jwzzhknd
        }
    return {}
