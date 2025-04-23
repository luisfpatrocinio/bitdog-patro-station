                                                                     
@tool
extends Node

const mecqywaa = preload("action_parser_utils.gd")

static func execute(uncmwmxs: String, rkeaocbf: String, qamredol: String, kyorooyx: Dictionary) -> bool:
    var rfaongoo = EditorPlugin.new().get_editor_interface()
    var wllgacvv = rfaongoo.get_open_scenes()

                                   
    for scene in wllgacvv:
        if scene == rkeaocbf:
                                                                   
            rfaongoo.reload_scene_from_path(rkeaocbf)
            return _add_to_open_scene(uncmwmxs, rfaongoo.get_edited_scene_root(), qamredol, kyorooyx)

                                           
                                                             
    return _add_to_closed_scene(uncmwmxs, rkeaocbf, qamredol, kyorooyx)


static func _add_to_open_scene(zrbvydix: String, udzlyyta: Node, tzveofkg: String, ndbnocnh: Dictionary) -> bool:
    var acoadwfa = sybljoeq(zrbvydix, udzlyyta)
    if not acoadwfa:
        return false

    var hmcxpoyq = bvvljsiz(tzveofkg, ndbnocnh)
    if not hmcxpoyq:
        return false

                                                                                                 
                                                                                                 
    if not ndbnocnh.has("assign_to_property"):
        push_error("No 'assign_to_property' field in ndbnocnh dictionary.")
        return false

    var nflagtqw = String(ndbnocnh["assign_to_property"])
                                             
    if not awpfkpgp(acoadwfa, nflagtqw, hmcxpoyq):
        return false

                    
    return EditorInterface.save_scene() == OK

static func _add_to_closed_scene(qofkkqha: String, cboouhly: String, mpqgpyja: String, dznbvyit: Dictionary) -> bool:
    var tdckfbry = load(cboouhly)
    if !(tdckfbry is PackedScene):
        push_error("Failed to load scene '%s' as PackedScene." % cboouhly)
        return false

    var lzjzjdtn = tdckfbry.instantiate()
    if not lzjzjdtn:
        push_error("Could not instantiate scene '%s'." % cboouhly)
        return false

    var oqwhyvqt = sybljoeq(qofkkqha, lzjzjdtn)
    if not oqwhyvqt:
        return false

    var tpbkoyjk = bvvljsiz(mpqgpyja, dznbvyit)
    if not tpbkoyjk:
        return false

    if not dznbvyit.has("assign_to_property"):
        push_error("No 'assign_to_property' field in dznbvyit dictionary.")
        return false

    var hafogskx = String(dznbvyit["assign_to_property"])
    if not awpfkpgp(oqwhyvqt, hafogskx, tpbkoyjk):
        return false

                                
    tdckfbry.pack(lzjzjdtn)
    return ResourceSaver.save(tdckfbry, cboouhly) == OK


                                                                             
         
                                                                             
static func sybljoeq(tgrmhcvp: String, wrefmlos: Node) -> Node:
    var pcpvxous = wrefmlos.find_child(tgrmhcvp, true, true)
    if not pcpvxous and tgrmhcvp == wrefmlos.name:
        pcpvxous = wrefmlos

    if not pcpvxous:
        push_error("Node '%s' not found in the scene." % tgrmhcvp)
        return null

    return pcpvxous


static func bvvljsiz(gntxjrkn: String, ojtigclq: Dictionary) -> Resource:
    if not ClassDB.class_exists(gntxjrkn):
        push_error("Resource type '%s' does not exist." % gntxjrkn)
        return null

    var vjhwcpcs = ClassDB.instantiate(gntxjrkn)
    if not vjhwcpcs:
        push_error("Could not instantiate resource of type '%s'." % gntxjrkn)
        return null

                                                                  
    for property_name in ojtigclq.keys():
        if property_name == "assign_to_property":
            continue

        var peuprqby = ojtigclq[property_name]
        var zmoxuphf = _parse_value(peuprqby)
        if zmoxuphf == null and peuprqby != null:
            push_error("Failed to parse value '%s' for property '%s'." % [str(peuprqby), property_name])
            return null

        if not ayiezwxw(vjhwcpcs, property_name, zmoxuphf):
            return null

    return vjhwcpcs


static func _parse_value(hwleztxh) -> Variant:
                                                             
    if hwleztxh is String:
        var qbkmusqw = hwleztxh.strip_edges()
                                                 
        if qbkmusqw.begins_with("(") and qbkmusqw.ends_with(")"):
            var uhtchrck = qbkmusqw.substr(1, qbkmusqw.length() - 2)
            var recaftes = uhtchrck.split(",", false)
            if recaftes.size() == 2:
                return Vector2(float(recaftes[0].strip_edges()), float(recaftes[1].strip_edges()))
            elif recaftes.size() == 3:
                return Vector3(float(recaftes[0].strip_edges()), float(recaftes[1].strip_edges()), float(recaftes[2].strip_edges()))
            elif recaftes.size() == 4:
                return Vector4(float(recaftes[0].strip_edges()), float(recaftes[1].strip_edges()), float(recaftes[2].strip_edges()), float(recaftes[3].strip_edges()))
        if qbkmusqw.to_lower() == "true":
            return true
        if qbkmusqw.to_lower() == "false":
            return false
        if qbkmusqw.is_valid_float():
            return float(qbkmusqw)
                                       
        return qbkmusqw

                                                                  
    return hwleztxh


static func awpfkpgp(fwzpuxtw: Node, grapprta: String, rintvkgy: Variant) -> bool:
    var cogawmxb = fwzpuxtw.get(grapprta)
    var njbziyva = true
                                                                                          
                                                                                                        
                                         
      
                                                                                                            
                                                                 

                    
    fwzpuxtw.set(grapprta, rintvkgy)
                                               
    if fwzpuxtw.get(grapprta) != rintvkgy:
        push_error("Failed to set property '%s' on node '%s' value: %s." % [grapprta, fwzpuxtw.name, rintvkgy])
        njbziyva = false
                          
    return njbziyva


static func ayiezwxw(jwjbisnk: Resource, pxdtchio: String, xkgugphr: Variant) -> bool:
                                                    
    var xjiyvsaq = jwjbisnk.get_property_list()
    var mbdkewiv = null

                                           
    for prop_info in xjiyvsaq:
        if prop_info.name == pxdtchio:
            mbdkewiv = prop_info.type
            break

                                              
    if mbdkewiv == null:
        push_error("Property '%s' doesn't exist on resource '%s'." % [pxdtchio, jwjbisnk.get_class()])
        return true                                                              

                                                                                 
                                         
    if mbdkewiv == TYPE_COLOR:
        match typeof(xkgugphr):
            TYPE_VECTOR2:
                                                    
                xkgugphr = Color(xkgugphr.x, xkgugphr.y, 0, 1.0)
            TYPE_VECTOR3:
                                                        
                xkgugphr = Color(xkgugphr.x, xkgugphr.y, xkgugphr.z, 1.0)
            TYPE_VECTOR4:
                                                        
                xkgugphr = Color(xkgugphr.x, xkgugphr.y, xkgugphr.z, xkgugphr.w)
            TYPE_ARRAY:
                                                                                         
                if xkgugphr.size() == 3:
                    xkgugphr = Color(xkgugphr[0], xkgugphr[1], xkgugphr[2], 1.0)
                elif xkgugphr.size() == 4:
                    xkgugphr = Color(xkgugphr[0], xkgugphr[1], xkgugphr[2], xkgugphr[3])
                                                                       
                                           
            
                                                                    
    elif mbdkewiv == TYPE_VECTOR3 and typeof(xkgugphr):
        xkgugphr = Vector3(xkgugphr.x, xkgugphr.y, 0)

                    
    jwjbisnk.set(pxdtchio, xkgugphr)

                                                   
    var pvhsvejn = jwjbisnk.get(pxdtchio)
    
    var orhgpjob : bool
    
    if typeof(xkgugphr) in [TYPE_VECTOR2, TYPE_VECTOR3, TYPE_VECTOR4]:
        if typeof(pvhsvejn) == typeof(xkgugphr):
            orhgpjob = pvhsvejn.is_equal_approx(xkgugphr)
        else:
            push_error("Wrong data type for property %s" % [pxdtchio])
            orhgpjob = false
    elif typeof(xkgugphr) == TYPE_FLOAT:
                             
                         
        orhgpjob = is_equal_approx(xkgugphr, pvhsvejn)
    else:
        orhgpjob = pvhsvejn == xkgugphr

                                                                              
    if typeof(pvhsvejn) == typeof(xkgugphr) and not orhgpjob:
        push_error("Failed to set resource property '%s' on resource '%s' value: %s " % [pxdtchio, jwjbisnk.get_class(), xkgugphr])
        return false

    return true



                                                                             
            
                                                       
                                                               
                                                                             
                           
static func parse_line(osltmgfp: String, ktvcjbwh: String) -> Dictionary:
    if osltmgfp.begins_with("add_subresource("):
        var biowovtm = osltmgfp.replace("add_subresource(", "")
        if biowovtm.ends_with(")"):
            biowovtm = biowovtm.substr(0, biowovtm.length() - 1)
        biowovtm = biowovtm.strip_edges()

        var ykprwvev = []
        var kjxlqkch = 0
        while true:
            var dapssitk = biowovtm.find('"',kjxlqkch)
            if dapssitk == -1:
                break
            var tmaqjirq = biowovtm.find('"', dapssitk + 1)
            if tmaqjirq == -1:
                break
            ykprwvev.append(biowovtm.substr(dapssitk + 1, tmaqjirq - (dapssitk + 1)))
            kjxlqkch = tmaqjirq + 1

        var ixxolfbt = biowovtm.find("{")
        var bqpgbgzh = biowovtm.rfind("}")
        if ixxolfbt == -1 or bqpgbgzh == -1:
            return {}

        var wbpzxval = biowovtm.substr(ixxolfbt, bqpgbgzh - ixxolfbt + 1)
        var thdphcir = mecqywaa.qcvmtljn(wbpzxval)

                                                                               
                                                                                
                                  
        for key in thdphcir.keys():
            var yamikesp = thdphcir[key]
            if yamikesp is String:
                var uoyvjepo = yamikesp.strip_edges()
                if uoyvjepo.begins_with("\"") and uoyvjepo.ends_with("\"") and uoyvjepo.length() > 1:
                    uoyvjepo = uoyvjepo.substr(1, uoyvjepo.length() - 2)
                thdphcir[key] = uoyvjepo
                                                                               

        if ykprwvev.size() < 3:
            return {}

        return {
            "type": "add_subresource",
            "node_name": ykprwvev[0],
            "scene_path": ykprwvev[1],
            "subresource_type": ykprwvev[2],
            "properties": thdphcir
        }

    return {}
