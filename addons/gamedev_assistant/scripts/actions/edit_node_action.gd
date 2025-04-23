                                                               
@tool
extends Node

const xddccfzl = preload("action_parser_utils.gd")

static func execute(ussbqvop: String, eyqlzqng: String, gymajqca: Dictionary) -> bool:
    var mxorsioi = EditorPlugin.new().get_editor_interface()
    var oybwwuhf = mxorsioi.get_open_scenes()

                                   
    for scene in oybwwuhf:
        if scene == eyqlzqng:
                                                     
            mxorsioi.reload_scene_from_path(eyqlzqng)
                                                             
            return xwuukgsz(ussbqvop, mxorsioi.get_edited_scene_root(), gymajqca)

                                                        
                                               
    return maikvyqp(ussbqvop, eyqlzqng, gymajqca)


static func xwuukgsz(vihnshrx: String, rdbjbikg: Node, gucvtaup: Dictionary) -> bool:
    var erzztvtu = rdbjbikg.find_child(vihnshrx, true, true)
    
    if not erzztvtu and vihnshrx == rdbjbikg.name:
        erzztvtu = rdbjbikg

    if not erzztvtu:
        push_error("Node '%s' not found in open scene root '%s'." % [vihnshrx, rdbjbikg.name])
        return false

                                                 
    if not aptetnkv(erzztvtu, gucvtaup, rdbjbikg):
        return false
        
                                                    
    return EditorInterface.save_scene() == OK


static func maikvyqp(yamxfdgy: String, sckumnrb: String, yqxeumek: Dictionary) -> bool:
    var grlwpttt = load(sckumnrb)
    if !(grlwpttt is PackedScene):
        push_error("Failed to load scene '%s' as PackedScene." % sckumnrb)
        return false

    var mdvuzvuw = grlwpttt.instantiate()
    if not mdvuzvuw:
        push_error("Could not instantiate scene '%s'." % sckumnrb)
        return false

    var uvjpqodw = mdvuzvuw.find_child(yamxfdgy, true, true)
    
    if not uvjpqodw and yamxfdgy == mdvuzvuw.name:
        uvjpqodw = mdvuzvuw

    if not uvjpqodw:
        push_error("Node '%s' not found in scene instance root '%s'." % [yamxfdgy, mdvuzvuw.name])
        return false

                                                        
    if not aptetnkv(uvjpqodw, yqxeumek, mdvuzvuw):
        return false

                                
    grlwpttt.pack(mdvuzvuw)
    return ResourceSaver.save(grlwpttt, sckumnrb) == OK


static func aptetnkv(belqzffg: Node, dfysvuzf: Dictionary, snjvbyum: Node = null) -> bool:
    for property_name in dfysvuzf.keys():
        var lbaitwdr = dfysvuzf[property_name]
        var secujlrg = _parse_value(lbaitwdr)
        if secujlrg == null and lbaitwdr != null:
            push_error("Failed to parse value '%s' for property '%s'." % [str(lbaitwdr), property_name])
            return false
            
                                     
                                                                                                           
                                                             
        var wqjgxfed = _try_set_property(belqzffg, property_name, secujlrg, snjvbyum)
        if not wqjgxfed:
            return false

    return true


static func _parse_value(gxrykagq) -> Variant:
                                                                                            
    if gxrykagq is String:
        var nzitzove = gxrykagq.strip_edges()
        
                                                        
        if nzitzove.length() >= 2 and nzitzove.begins_with('"') and nzitzove.ends_with('"'):
            nzitzove = nzitzove.substr(1, nzitzove.length() - 2)
        elif nzitzove.length() >= 2 and nzitzove.begins_with("'") and nzitzove.ends_with("'"):
            nzitzove = nzitzove.substr(1, nzitzove.length() - 2)
        
        if nzitzove.begins_with("(") and nzitzove.ends_with(")"):
            var tkvogoev = nzitzove.substr(1, nzitzove.length() - 2)
            var hwbzaxto = tkvogoev.split(",", false)
                                                  
            if hwbzaxto.size() == 2:
                var lujzlmse = float(hwbzaxto[0].strip_edges())
                var gkywsbjz = float(hwbzaxto[1].strip_edges())
                return Vector2(lujzlmse, gkywsbjz)
                                                  
            if hwbzaxto.size() == 3:
                var fbsftqhk = float(hwbzaxto[0].strip_edges())
                var wukmhihd = float(hwbzaxto[1].strip_edges())
                var lwyesqpo = float(hwbzaxto[2].strip_edges())
                return Vector3(fbsftqhk, wukmhihd, lwyesqpo)
                                                  
            if hwbzaxto.size() == 4:
                var wikbszpp = float(hwbzaxto[0].strip_edges())
                var xucbgges = float(hwbzaxto[1].strip_edges())
                var jrwevwtu = float(hwbzaxto[2].strip_edges())
                var sipzxxko = float(hwbzaxto[3].strip_edges())
                return Vector4(wikbszpp, xucbgges, jrwevwtu, sipzxxko)
                               
        if nzitzove.to_lower() == "true":
            return true
        if nzitzove.to_lower() == "false":
            return false
                                
        if nzitzove.is_valid_float():
            return float(nzitzove)
                                                
        return nzitzove

                                                             
    return gxrykagq

static func dwdfdvkp(qbgnkrnn: String, vntojbwh: String) -> String:
    var tzfwzcyr = ""
    var ruiisjuz = qbgnkrnn.length()
    var xwcyupej = vntojbwh.length()
    var lwgxphto = min(ruiisjuz, xwcyupej)

    for i in range(lwgxphto):
        if qbgnkrnn[i] != vntojbwh[i]:
            tzfwzcyr += "Difference at index: " + str(i) + ", String1: " + qbgnkrnn[i] + ", String2: " + vntojbwh[i]
            break

    return tzfwzcyr


static func _try_set_property(ydthpwub: Node, wxvemtko: String, nggnxfjz: Variant, jzlcckxe: Node = null) -> bool:  
                                      
    if wxvemtko == "parent":
        if not nggnxfjz is String:
            push_error("Parent value must be a string (name of the new parent)")
            return false

        if jzlcckxe == null:
            push_error("Cannot re-parent without a valid scene root.")
            return false

        var dtahdsca = nggnxfjz.strip_edges()
        var eburdiko: Node

                                                 
                                                                          
        if dtahdsca == "" or dtahdsca == jzlcckxe.name:
            eburdiko = jzlcckxe
        else:
            eburdiko = jzlcckxe.find_child(dtahdsca, true, true)
            if not eburdiko:
                push_error("Failed to find parent node with name: %s" % dtahdsca)
                return false
        
                   
        if ydthpwub.get_parent():
            ydthpwub.get_parent().remove_child(ydthpwub)
        eburdiko.add_child(ydthpwub)

                                                                          
        ydthpwub.set_owner(jzlcckxe)

        return true

                                      
    var neotslhp = ydthpwub.get_property_list()
    for prop in neotslhp:
        if prop.name == wxvemtko:
                        
            if prop.type == TYPE_COLOR:
                match typeof(nggnxfjz):
                    TYPE_VECTOR2:
                                                            
                        nggnxfjz = Color(nggnxfjz.x, nggnxfjz.y, 0, 1.0)
                    TYPE_VECTOR3:
                                                                
                        nggnxfjz = Color(nggnxfjz.x, nggnxfjz.y, nggnxfjz.z, 1.0)
                    TYPE_VECTOR4:
                        nggnxfjz = Color(nggnxfjz.x, nggnxfjz.y, nggnxfjz.z, nggnxfjz.w)
                    TYPE_ARRAY:
                                                                                                  
                        if nggnxfjz.size() == 3:
                            nggnxfjz = Color(nggnxfjz[0], nggnxfjz[1], nggnxfjz[2], 1.0)
                        elif nggnxfjz.size() == 4:
                            nggnxfjz = Color(nggnxfjz[0], nggnxfjz[1], nggnxfjz[2], nggnxfjz[3])

                                                                       
            elif prop.type == TYPE_OBJECT and prop.hint == PROPERTY_HINT_RESOURCE_TYPE:
                var bvlmphwx = prop.hint_string
                
                                           
                if bvlmphwx == "Texture2D" or bvlmphwx.contains("Texture2D"):
                    var tzczlzkf = load(nggnxfjz)

                                                                                        
                    if "_" in wxvemtko:
                        var cqeuabxb = wxvemtko.split("_")
                        if cqeuabxb.size() > 1:
                            var wwgzphtn = cqeuabxb[1]
                            var spphofcn = "set_texture_" + wwgzphtn
                            if ydthpwub.has_method(spphofcn):
                                ydthpwub.call(spphofcn, tzczlzkf)
                                return true

                                                                           
                    if ydthpwub.has_method("set_texture"):
                        ydthpwub.set_texture(tzczlzkf)
                        return true
                        
                                             
                elif bvlmphwx == "Mesh" or bvlmphwx.contains("Mesh"):
                    var dnjdaidt = load(nggnxfjz)
                    if not dnjdaidt:
                        push_error("Failed to load mesh at path: %s" % nggnxfjz)
                        return false
                    
                    if "_" in wxvemtko:
                        var cqeuabxb = wxvemtko.split("_")
                        if cqeuabxb.size() > 1:
                            var wwgzphtn = cqeuabxb[1]
                            var spphofcn = "set_mesh_" + wwgzphtn
                            if ydthpwub.has_method(spphofcn):
                                ydthpwub.call(spphofcn, dnjdaidt)
                                return true
                    
                    ydthpwub.set(wxvemtko, dnjdaidt)
                    return true
                
                                                
                elif bvlmphwx == "AudioStream" or bvlmphwx.contains("AudioStream"):
                    var jzngygdc = load(nggnxfjz)
                    if not jzngygdc:
                        push_error("Failed to load audio stream at path: %s" % nggnxfjz)
                        return false
                    ydthpwub.set(wxvemtko, jzngygdc)
                    return true



                                                                 
    if not ydthpwub.has_method("get") or ydthpwub.get(wxvemtko) == null:
        push_error("Property '%s' doesn't exist on node '%s'." % [wxvemtko, ydthpwub.name])
        return false

                                    
    ydthpwub.set(wxvemtko, nggnxfjz)

                                                               
                                                          
    return true


                                                                             
                 
                                                                      
                                                                             
static func parse_line(nkwupwns: String, stndlhwu: String) -> Dictionary:
                                                     
    if nkwupwns.begins_with("edit_node("):
        var qbpbjyaz = xddccfzl.tuhjxtkg(nkwupwns)
                                                            
        if qbpbjyaz.size() == 0:
            return {}
        if not qbpbjyaz.has("node_name") \
            or not qbpbjyaz.has("scene_path") \
            or not qbpbjyaz.has("modifications"):
            return {}

        return {
            "type": "edit_node",
            "node_name": qbpbjyaz.node_name,
            "scene_path": qbpbjyaz.scene_path,
            "modifications": qbpbjyaz.modifications
        }

    return {}
