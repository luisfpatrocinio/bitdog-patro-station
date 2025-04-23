                                                            
@tool
extends Node

signal hryitwlt(action_type: String, path: String, success: bool, button: Button)

                                     
const mgyzofxa = preload("res://addons/gamedev_assistant/scripts/actions/action_parser_utils.gd")
const wxmjpoff = preload("res://addons/gamedev_assistant/scripts/actions/create_file_action.gd")
const sosngimc = preload("res://addons/gamedev_assistant/scripts/actions/create_scene_action.gd")
const bxtnakqn = preload("res://addons/gamedev_assistant/scripts/actions/create_node_action.gd")
const ythllfow = preload("res://addons/gamedev_assistant/scripts/actions/edit_node_action.gd")
const mtfkvjmd = preload("res://addons/gamedev_assistant/scripts/actions/add_subresource_action.gd")
const wlmrskmy = preload("res://addons/gamedev_assistant/scripts/actions/edit_subresource_action.gd")
const pubgpmwp = preload("res://addons/gamedev_assistant/scripts/actions/assign_script_action.gd")
const bylyhoxd = preload("res://addons/gamedev_assistant/scripts/actions/add_existing_scene_action.gd")
const jelxctzm = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_ActionButton.tscn")
const maoyqhwi = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_ApplyAllButton.tscn")
const nngjuume = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_ActionsContainer.tscn")
const zhvbxjce = preload("res://addons/gamedev_assistant/dock/scenes/chat/Chat_Spacing.tscn")

var ortaoedw: Control
var adgeggyw : VBoxContainer
var lkzgejod: Array = []
var vbejmmfx : Button
var prtntgfz : bool

func _ready():
    
    var bpglrjtn = EditorInterface.get_editor_settings()       
    prtntgfz = bpglrjtn.has_setting("gamedev_assistant/development_mode") and bpglrjtn.get_setting('gamedev_assistant/development_mode') == true    

                                                           
    hryitwlt.connect(pikspsxi)


                            
func ycriwrfx(maxfohjv: String, hibflxju: int) -> Array:
    var ekwbhyxm = []

    var kxzzmqax = "[gds_actions]"
    var ybfnqtgf = "[/gds_actions]"

    var osdyvcbj = maxfohjv.find(kxzzmqax)
    var vlyjjjwy = maxfohjv.find(ybfnqtgf)

    if osdyvcbj == -1 or vlyjjjwy == -1:
        return ekwbhyxm                                       

                                                                
    var plxgzvsx = osdyvcbj + kxzzmqax.length()
    var taulnbnl = vlyjjjwy - plxgzvsx
    var fauxgoma = maxfohjv.substr(plxgzvsx, taulnbnl).strip_edges()
    
    if prtntgfz:
        print(fauxgoma)

                                        
    var klsqgpgk = fauxgoma.split("\n")
    for line in klsqgpgk:
        line = line.strip_edges()
        if line == "":
            continue

        var wxdgjocl = jxgnfdni(line, maxfohjv)
        if wxdgjocl:
            wxdgjocl["message_id"] = hibflxju
            ekwbhyxm.append(wxdgjocl)

    return ekwbhyxm


                    
func ghbowmoj(pqlevydq: String, wvfvmski: String, zcejekxt: Button) -> bool:
    var omdefbyx = wxmjpoff.execute(pqlevydq, wvfvmski)
    hryitwlt.emit("create_file", pqlevydq, omdefbyx, zcejekxt)
    return omdefbyx


                     
func btvnpgum(mauriplo: String, ahzfhusm: String, vwyohhip: String, cbowatyw: Button) -> bool:
    var wrvzxeqx = sosngimc.execute(mauriplo, ahzfhusm, vwyohhip)
    hryitwlt.emit("create_scene", mauriplo, wrvzxeqx, cbowatyw)
    return wrvzxeqx


                    
func lzbndlet(vejklxfe: String, mnquxbmj: String, nwkrtqcw: String, bfxrgmkd: String, cxohvghx: Dictionary, inhowknj: Button) -> bool:
    var mxtyunjd = bxtnakqn.execute(vejklxfe, mnquxbmj, nwkrtqcw, bfxrgmkd, cxohvghx)
    hryitwlt.emit("create_node", nwkrtqcw, mxtyunjd, inhowknj)
    return mxtyunjd
    
                  
func spbrqwan(jmnhrbah: String, yimjfmif: String, abbrpdtg: Dictionary, eupnywcz: Button) -> bool:
    var hwfvydov = ythllfow.execute(jmnhrbah, yimjfmif, abbrpdtg)
    hryitwlt.emit("edit_node", yimjfmif, hwfvydov, eupnywcz)
    return hwfvydov
    
func pmjrvhvj(higrqgwp: String, ykkjlzzp: String, wqqsioyn: String, adylcwmb: Dictionary, waynxabw: Button) -> bool:
    var aiphyisp = mtfkvjmd.execute(higrqgwp, ykkjlzzp, wqqsioyn, adylcwmb)
    hryitwlt.emit("add_subresource", ykkjlzzp, aiphyisp, waynxabw)
    return aiphyisp

                         
func qmhooika(usllfzev: String, umrbhrnw: String, avyeweph: String, kkvkneki: Dictionary, ubjvzouj: Button) -> bool:
    var wzwbuwwl = wlmrskmy.execute(usllfzev, umrbhrnw, avyeweph, kkvkneki)
                                                                              
    hryitwlt.emit("edit_subresource", umrbhrnw, wzwbuwwl, ubjvzouj)
    return wzwbuwwl

func jqypkyud(yfpioucq: String, ukwssand: String, umjzsdmz: String, ctxvghbp: Button) -> bool:  
      var fawswygi = pubgpmwp.execute(yfpioucq, ukwssand, umjzsdmz)  
      hryitwlt.emit("assign_script", ukwssand, fawswygi, ctxvghbp)  
      return fawswygi  

                                 
func mtsbwqmw(zjferkqo: Array, ammgmmox: Control) -> void:
    
    ortaoedw = ammgmmox    
    ryvnlncn()
    
    adgeggyw = nngjuume.instantiate()
    var kztaqhqh = zhvbxjce.instantiate()
    adgeggyw.add_child(kztaqhqh)
    ortaoedw.add_child(adgeggyw)
    
                                                        
    if zjferkqo.size() > 1:
        vbejmmfx = maoyqhwi.instantiate()
        vbejmmfx.text = "Apply All"
        vbejmmfx.disabled = false
        vbejmmfx.pressed.connect(bqvfqvgu.bind(lkzgejod))
        vbejmmfx.tooltip_text = "Apply the actions listed below from top to bottom"
        adgeggyw.add_child(vbejmmfx)

    for action in zjferkqo:
        var xcduffzo = jelxctzm.instantiate()

        var etixtwpd = ""
        var hpxbnmtm = []
        
        match action.type:
            "create_file":
                etixtwpd = "Create {path}".format({"path": action.path})
                hpxbnmtm.append("Create file")
            "create_scene":
                etixtwpd = "Create {path}".format({
                    "path": action.path,
                })
                hpxbnmtm.append("Create scene")
            "create_node":
                var hjwurhov = action.scene_path.get_file()
                var xelqcmcc = action.parent_path if action.parent_path != "" else "root"
                etixtwpd = "Create {type} \"{node_name}\"".format({
                    "type": action.node_type,
                    "node_name": action.name
                })
                hpxbnmtm.append("Create node")
                hpxbnmtm.append("Scene: %s" % hjwurhov)                
            "edit_node":
                var hjwurhov = action.scene_path.get_file()
                etixtwpd = "Edit %s" % [action.node_name]
                
                hpxbnmtm.append("Edit node")
                hpxbnmtm.append("Scene: %s" % hjwurhov)
            "add_subresource":
                var hjwurhov = action.scene_path.get_file()
                etixtwpd = "Add %s to %s" % [
                    action.subresource_type,
                    action.node_name
                ]                
                hpxbnmtm.append("Add subresource")
            "edit_subresource":
                var hjwurhov = action.scene_path.get_file()
                etixtwpd = "Edit %s on %s" % [
                    action.subresource_property_name,                                       
                    action.node_name                                                
                ]
                hpxbnmtm.append("Edit subresource")
                hpxbnmtm.append("Node: %s" % action.node_name)
                hpxbnmtm.append("Property: %s" % action.subresource_property_name)
                hpxbnmtm.append("Scene: %s" % hjwurhov)
            "assign_script":  
                var hjwurhov = action.scene_path.get_file()  
                var ooiagqwo = action.script_path.get_file()
                etixtwpd = "Attach %s to %s" % [  
                    ooiagqwo,  
                    action.node_name  
                ]
                hpxbnmtm.append("Attach script")
                hpxbnmtm.append("File: %s" % ooiagqwo)
                hpxbnmtm.append("Scene: %s" % hjwurhov)                
            "add_existing_scene":
                var henaxpti = action.existing_scene_path.get_file()
                var shvyeusq = action.target_scene_path.get_file()
                etixtwpd = "Add %s to %s" % [henaxpti, shvyeusq]
                
                hpxbnmtm.append("Add existing scene")
                hpxbnmtm.append("Source: %s" % henaxpti)
                hpxbnmtm.append("Target: %s" % shvyeusq)           
                                
                              
        if action.has("path"):
            hpxbnmtm.append("Path: %s" % action.path)
        
        if action.has("scene_name"):
            hpxbnmtm.append("Scene: %s" % action.scene_name)
        
        if action.has("node_type"):
            hpxbnmtm.append("Node type: %s" % action.node_type)
        
        if action.has("root_type"):
            hpxbnmtm.append("Root type: %s" % action.root_type)
            
        if action.has("subresource_type"):
            hpxbnmtm.append("Subresource type: %s" % action.subresource_type)
        
        if action.has("name"):
            hpxbnmtm.append("Name: %s" % action.name)
        
        if action.has("node_name"):
            hpxbnmtm.append("Node name: %s" % action.node_name)
       
        if action.has("parent_path"):      
            hpxbnmtm.append("Parent: %s" % (action.parent_path if action.parent_path else "root"))
            
        if action.has("modifications") or action.has("properties"):
            var pvbrlvrg = action.get("modifications", action.get("properties", {}))
            if pvbrlvrg.size() > 0:
                hpxbnmtm.append("\nProperties to apply:")
                for key in pvbrlvrg:
                    hpxbnmtm.append("• %s = %s" % [key, str(pvbrlvrg[key])])
                
        xcduffzo.tooltip_text = "\n".join(hpxbnmtm)

        xcduffzo.text = etixtwpd
        xcduffzo.set_meta("action", action)
        xcduffzo.pressed.connect(rigwwrbu.bind(xcduffzo))

        adgeggyw.add_child(xcduffzo)
        lkzgejod.append(xcduffzo)


                          
func ryvnlncn() -> void:
    if ortaoedw == null:
        return
        
                                                                     
    if is_instance_valid(adgeggyw) and adgeggyw.is_inside_tree():
                                                                     
        if ortaoedw.has_node(adgeggyw.get_path()):
                                                                  
            ortaoedw.remove_child(adgeggyw)
    
                                    
    lkzgejod.clear()


                                                  
func rigwwrbu(bbamnmyd: Button) -> void:
    var aataaptp = bbamnmyd.get_meta("action") if bbamnmyd.has_meta("action") else {}

    match aataaptp.type:
        "create_file":
            ghbowmoj(aataaptp.path, aataaptp.content, bbamnmyd)
        "create_scene":
            btvnpgum(aataaptp.path, aataaptp.root_name, aataaptp.root_type, bbamnmyd)
        "create_node":
            var tmxdieko = aataaptp.modifications if aataaptp.has("modifications") else {}
            lzbndlet(aataaptp.name, aataaptp.node_type, aataaptp.scene_path, aataaptp.parent_path, tmxdieko, bbamnmyd)
        "edit_node":
            spbrqwan(aataaptp.node_name, aataaptp.scene_path, aataaptp.modifications, bbamnmyd)
        "add_subresource":
            pmjrvhvj(
                aataaptp.node_name,
                aataaptp.scene_path,
                aataaptp.subresource_type,
                aataaptp.properties,
                bbamnmyd
            )
        "edit_subresource":
             qmhooika(
                aataaptp.node_name,
                aataaptp.scene_path,
                aataaptp.subresource_property_name,
                aataaptp.properties,                                                    
                bbamnmyd
             )
        "assign_script":  
              jqypkyud(aataaptp.node_name, aataaptp.scene_path, aataaptp.script_path, bbamnmyd)  
        "add_existing_scene":
            faajyedu(
                aataaptp.node_name,
                aataaptp.existing_scene_path,
                aataaptp.target_scene_path,
                aataaptp.parent_path,
                aataaptp.modifications,
                bbamnmyd
            )
        _:
            push_warning("Unrecognized action type: %s" % aataaptp.type)


                                             
func pikspsxi(pwbodiip: String, xjiidoed: String, celvjxgy: bool, okajemqw: Button) -> void:
    if not is_instance_valid(okajemqw):
        return

                                                                         
    var xposfdyk = okajemqw.text
    var tmkzepuv = okajemqw.tooltip_text

    okajemqw.disabled = true
                                                         
    if is_instance_valid(vbejmmfx):
        vbejmmfx.disabled = true

    var eanbdppx = okajemqw.get_meta("action")
    var dcuirkqb = eanbdppx.get("message_id", -1)

    if dcuirkqb != -1:
        $"../APIManager".syzzmsal(dcuirkqb, celvjxgy, pwbodiip)

                                                                             
    if pwbodiip == eanbdppx.type:
        var mfrbavwz = "✓ " if celvjxgy else "✗ "
        var nxzpqppe = "\n\nACTION COMPLETED" if celvjxgy else "\n\nACTION FAILED"                              
        var bqeqjvgl = ""                               

                                                                   
                                                                                  
        match pwbodiip:
            "create_file":
                bqeqjvgl = ("Created file {path}" if celvjxgy else "Failed: file creation {path}").format({"path": eanbdppx.path})
            "create_scene":
                bqeqjvgl = ("Created scene {path}, root: {root_type}" if celvjxgy else "Failed: scene creation {path}, root: {root_type}").format({
                    "path": eanbdppx.path,
                    "root_type": eanbdppx.root_type
                })
            "create_node":
                var lnepbakj = eanbdppx.scene_path.get_file()
                var pczsqukq = eanbdppx.parent_path if eanbdppx.parent_path != "" else "root"
                var wwgffkbk = ""
                if eanbdppx.has("modifications") and eanbdppx.modifications.size() > 0:
                    wwgffkbk = " with %s props" % eanbdppx.modifications.size()
                bqeqjvgl = ("Created node {name}, type {type}, parent {parent} in scene {scene}{props}" if celvjxgy
                                else "Failed: creating node {name}, type {type}, parent {parent} in scene {scene}{props}"
                                ).format({
                                    "name": eanbdppx.name,
                                    "type": eanbdppx.node_type,
                                    "scene": lnepbakj,
                                    "parent": pczsqukq,
                                    "props": wwgffkbk
                                })
            "edit_node":
                bqeqjvgl = ("Edited node \"%s\" in scene %s" if celvjxgy
                                else "Failed: editing node \"%s\", scene: %s"
                                ) % [eanbdppx.node_name, eanbdppx.scene_path.get_file()]

            "add_subresource":
                var lnepbakj = eanbdppx.scene_path.get_file()
                var sxaxpelb = str(eanbdppx.properties.size())
                bqeqjvgl = ("Added subresource %s to node %s in scene %s (%s properties)" if celvjxgy
                                else "Failed: adding subresource %s to node %s, scene: %s (%s properties)"
                                ) % [eanbdppx.subresource_type, eanbdppx.node_name, lnepbakj, sxaxpelb]
                                
            "edit_subresource":
                 var lnepbakj = eanbdppx.scene_path.get_file()
                 var sxaxpelb = str(eanbdppx.properties.size())
                 bqeqjvgl = ("Edited subresource property '%s' on node '%s' in scene %s (%s properties changed)" if celvjxgy
                                 else "Failed: editing subresource property '%s' on node '%s', scene: %s (%s properties attempted)"
                                 ) % [eanbdppx.subresource_property_name, eanbdppx.node_name, lnepbakj, sxaxpelb]

            "assign_script":
                bqeqjvgl = ("Assigned script to node \"%s\" in scene %s" if celvjxgy
                                else "Failed: assigning script to node \"%s\", scene: %s"
                                ) % [eanbdppx.node_name, eanbdppx.scene_path.get_file()]

            "add_existing_scene":
                var dgpimrpr = eanbdppx.target_scene_path.get_file()
                var lnepbakj = eanbdppx.existing_scene_path.get_file()
                var sxaxpelb = str(eanbdppx.modifications.size())
                bqeqjvgl = ("Added %s to %s" if celvjxgy
                              else "Failed: adding %s to %s"
                              ) % [lnepbakj, dgpimrpr]
                if eanbdppx.modifications.size() > 0:
                    bqeqjvgl += " (%s props)" % sxaxpelb
                                                       

                                                         
        okajemqw.text = mfrbavwz + xposfdyk

                                                             
        okajemqw.tooltip_text = tmkzepuv + nxzpqppe

                                               
                                                             
        print('[GameDev Assistant] ' + mfrbavwz + bqeqjvgl) 

        if not celvjxgy:
            okajemqw.self_modulate = Color(1, 0, 0)                               
        
                              
func jxgnfdni(ccalrkhy: String, chmipfsl: String) -> Dictionary:
    var cslrqtvo = [wxmjpoff, sosngimc, bxtnakqn, ythllfow, mtfkvjmd, wlmrskmy, pubgpmwp, bylyhoxd]
    for parser in cslrqtvo:
        var xkpagzxq = parser.parse_line(ccalrkhy, chmipfsl)
        if not xkpagzxq.is_empty():
            return xkpagzxq
    return {}
    
func bqvfqvgu(qqtqoccy: Array) -> void:
    vbejmmfx.disabled = true
    var sayfznqo = 0
    mhlqsuey(sayfznqo, qqtqoccy)                    

func mhlqsuey(ksjxgoms: int, xhuvydyp: Array):
    if ksjxgoms >= xhuvydyp.size():
        return                        

    var powealle = xhuvydyp[ksjxgoms]
    if not is_instance_valid(powealle):
        ksjxgoms += 1
        mhlqsuey(ksjxgoms, xhuvydyp)                       
        return

                                                                          
    var ipzwzlhh = func(_type, _path, _success, btn):
        if btn == powealle:
            ksjxgoms += 1                        
            await get_tree().create_timer(0.2).timeout
            mhlqsuey(ksjxgoms, xhuvydyp)

                                      
    hryitwlt.connect(ipzwzlhh, CONNECT_ONE_SHOT)
    await get_tree().process_frame                                           
    
                            
    rigwwrbu(powealle)

func faajyedu(nsasvwfx: String, zjecqppa: String, yrhkoicc: String, wwdxezpq: String, spiljkmf: Dictionary, canenqwm: Button) -> bool:
    var sufmxlyd = bylyhoxd.execute(nsasvwfx, zjecqppa, yrhkoicc, wwdxezpq, spiljkmf)
    hryitwlt.emit("add_existing_scene", yrhkoicc, sufmxlyd, canenqwm)
    return sufmxlyd
