                                                                      
@tool
extends Node

const jjrqdtzx = preload("action_parser_utils.gd")
                                                                            
                                                   
const hbjensto = preload("add_subresource_action.gd")

static func execute(kulmdoix: String, dwaebhak: String, iapfmxtd: String, evohatrh: Dictionary) -> bool:
    var tnhwpzcm = EditorPlugin.new().get_editor_interface()
    var bcdqahok = tnhwpzcm.get_open_scenes()

                                   
    for scene in bcdqahok:
        if scene == dwaebhak:
                                                                    
            tnhwpzcm.reload_scene_from_path(dwaebhak)
            return _edit_in_open_scene(kulmdoix, tnhwpzcm.get_edited_scene_root(), iapfmxtd, evohatrh)

                                           
                                                              
    return _edit_in_closed_scene(kulmdoix, dwaebhak, iapfmxtd, evohatrh)


static func _edit_in_open_scene(vmvxfvni: String, lgekswmv: Node, mccjqnga: String, zabntbcn: Dictionary) -> bool:
    var hqkfrzxv = hbjensto.sybljoeq(vmvxfvni, lgekswmv)               
    if not hqkfrzxv:
        return false

    var cozoobfh = hqkfrzxv.get(mccjqnga)
    if not (cozoobfh is Resource):
        push_error("Property '%s' on node '%s' is not a Resource or doesn't exist." % [mccjqnga, vmvxfvni])
        return false

    if not sxljkgkq(cozoobfh, zabntbcn):
        return false

                         
    EditorInterface.edit_resource(cozoobfh)                                 
    return EditorInterface.save_scene() == OK

static func _edit_in_closed_scene(rrkpmmng: String, jzclxlws: String, bvxmunaw: String, xwvqmyfw: Dictionary) -> bool:
    var eojujdcq = load(jzclxlws)
    if !(eojujdcq is PackedScene):
        push_error("Failed to load scene '%s' as PackedScene." % jzclxlws)             
        return false

    var ejwdnbrz = eojujdcq.instantiate()
    if not ejwdnbrz:
        push_error("Could not instantiate scene '%s'." % jzclxlws)             
        return false

    var dgjoozvj = hbjensto.sybljoeq(rrkpmmng, ejwdnbrz)               
    if not dgjoozvj:
        return false

    var bgulmzzt = dgjoozvj.get(bvxmunaw)
    if not (bgulmzzt is Resource):
        push_error("Property '%s' on node '%s' is not a Resource or doesn't exist." % [bvxmunaw, rrkpmmng])
                                                           
        ejwdnbrz.free()
        return false

    if not sxljkgkq(bgulmzzt, xwvqmyfw):
                                                   
        ejwdnbrz.free()
        return false

                                
                                                                       
                                                                        
                                                                                  
                                                                      
    eojujdcq.pack(ejwdnbrz)
    var irpxvivm = ResourceSaver.save(eojujdcq, jzclxlws)

                                                                
    ejwdnbrz.free()

    return irpxvivm == OK


                                                                             
         
                                                                             
static func sxljkgkq(okodvnfc: Resource, rdhygaoh: Dictionary) -> bool:
                                  
    for property_name in rdhygaoh.keys():
        var fsvztqqm = rdhygaoh[property_name]
                                                          
        var uzrisims = hbjensto._parse_value(fsvztqqm)                         
        if uzrisims == null and fsvztqqm != null:
            push_error("Failed to parse value '%s' for property '%s'." % [str(fsvztqqm), property_name])             
                                                                          
            return false

                                                                             
        if not hbjensto.ayiezwxw(okodvnfc, property_name, uzrisims):                                                     
                                                               
            return false

    return true


                                                                             
            
                                                       
                                                                
                                                                                                                     
                                                                             
static func parse_line(ingktzpt: String, szksqwgq: String) -> Dictionary:
    if ingktzpt.begins_with("edit_subresource("):
        var vptgzwfs = ingktzpt.replace("edit_subresource(", "")
        if vptgzwfs.ends_with(")"):
            vptgzwfs = vptgzwfs.substr(0, vptgzwfs.length() - 1)             
        vptgzwfs = vptgzwfs.strip_edges()

                                                                                                
        var fqpyrxjx = []
        var gymoethe = 0
        var yyathmyu = 0
        while yyathmyu < 3:                             
            var okykzheh = vptgzwfs.find('"',gymoethe)
            if okykzheh == -1:
                break                         
            var ngneusny = vptgzwfs.find('"', okykzheh + 1)
            if ngneusny == -1:
                break                       
            fqpyrxjx.append(vptgzwfs.substr(okykzheh + 1, ngneusny - (okykzheh + 1)))             
            gymoethe = ngneusny + 1
            yyathmyu += 1
                                                                         
            var fqhgbtwh = vptgzwfs.find(",", gymoethe)
            if fqhgbtwh != -1:
                gymoethe = fqhgbtwh + 1
            else:
                                                                                                    
                if yyathmyu < 3: break                                               

        if fqpyrxjx.size() < 3:
            push_error("Edit Subresource: Failed to parse required string arguments (node_name, scene_path, subresource_property_name). Line: " + ingktzpt)
            return {}

                                                                        
        var ndftckte = vptgzwfs.find("{", gymoethe)                                 
        var rrzplegx = vptgzwfs.rfind("}")
        if ndftckte == -1 or rrzplegx == -1 or rrzplegx < ndftckte:
            push_error("Edit Subresource: Failed to find or parse properties dictionary. Line: " + ingktzpt)
            return {}

        var xwvswxwx = vptgzwfs.substr(ndftckte, rrzplegx - ndftckte + 1)             
                                                                           
        var iqtiabfj = jjrqdtzx.qcvmtljn(xwvswxwx)                                 

                                                                           
                                                                                   

        return {
            "type": "edit_subresource",
            "node_name": fqpyrxjx[0],
            "scene_path": fqpyrxjx[1],
            "subresource_property_name": fqpyrxjx[2],
            "properties": iqtiabfj                                         
        }

    return {}
