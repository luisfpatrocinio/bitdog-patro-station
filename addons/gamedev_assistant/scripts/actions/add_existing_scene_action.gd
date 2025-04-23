                                                                 
@tool
extends Node

const wyxanjzy = preload("action_parser_utils.gd")
const vdrvorah = preload("edit_node_action.gd")

static func execute(ugpprdot: String, lstiiglj: String, nrytjtcv: String, sbexddqn: String, cbcxjcxs: Dictionary) -> bool:
    var hlilihtk = EditorPlugin.new().get_editor_interface()
    var dsbcgjbo = hlilihtk.get_open_scenes()
    
    var txhdiivg = load(lstiiglj)
    if not txhdiivg is PackedScene:
        push_error("Invalid scene file: " + lstiiglj)
        return false
    
    if nrytjtcv in dsbcgjbo:
        return vyaagixm(ugpprdot, txhdiivg, nrytjtcv, sbexddqn, cbcxjcxs)
    else:
        return jzxhrhff(ugpprdot, txhdiivg, nrytjtcv, sbexddqn, cbcxjcxs)

static func vyaagixm(ugikucwi: String, fnuhnuom: PackedScene, qopljdge: String, robewvjj: String, prpdswwg: Dictionary) -> bool:
    var gkqjzfrz = EditorPlugin.new().get_editor_interface()
    gkqjzfrz.reload_scene_from_path(qopljdge)
    var edxaddpm = gkqjzfrz.get_edited_scene_root()
    
    var cngiaqzw = edxaddpm if (robewvjj.is_empty() or robewvjj == edxaddpm.name) else edxaddpm.find_child(robewvjj, true, true)  
    if not cngiaqzw:  
        if robewvjj == edxaddpm.name:  
            cngiaqzw = edxaddpm  
        else:  
            return false  
    
    var zvljxntv = fnuhnuom.instantiate()
    zvljxntv.name = ugikucwi
    cngiaqzw.add_child(zvljxntv)
    zvljxntv.set_owner(edxaddpm)
    
    if not prpdswwg.is_empty():
        if not vdrvorah.aptetnkv(zvljxntv, prpdswwg, edxaddpm):
            return false
    
    return EditorPlugin.new().get_editor_interface().save_scene() == OK

static func jzxhrhff(ptlnahyy: String, bjlcefmu: PackedScene, mttdszvj: String, jmjuopff: String, ugogvxlx: Dictionary) -> bool:
    var mwwboyma = load(mttdszvj)
    if not mwwboyma is PackedScene:
        push_error("Invalid target scene: " + mttdszvj)
        return false
    
    var jxevibza = mwwboyma.instantiate()
    var ftjyrvav = jxevibza if (jmjuopff.is_empty() or jmjuopff == jxevibza.name) else jxevibza.find_child(jmjuopff, true, true)  
    if not ftjyrvav:  
        if jmjuopff == jxevibza.name:  
            ftjyrvav = jxevibza  
        else:  
            return false  
    
    var lrykrrgj = bjlcefmu.instantiate()
    lrykrrgj.name = ptlnahyy
    ftjyrvav.add_child(lrykrrgj)
    lrykrrgj.set_owner(jxevibza)
    
    if not ugogvxlx.is_empty():
        if not vdrvorah.aptetnkv(lrykrrgj, ugogvxlx, jxevibza):
            return false
    
    mwwboyma.pack(jxevibza)
    return ResourceSaver.save(mwwboyma, mttdszvj) == OK

static func parse_line(wgiobksi: String, kvfpmbwp: String) -> Dictionary:
    if wgiobksi.begins_with("add_existing_scene("):
        var elkqsjnh = wgiobksi.replace("add_existing_scene(", "").strip_edges()
        if elkqsjnh.ends_with(")"):
            elkqsjnh = elkqsjnh.substr(0, elkqsjnh.length() - 1).strip_edges()
        
        var zpjynfso = []
        var udiyygkt = 0
                                             
        for _i in range(4):
            var ymdacrqu = elkqsjnh.find('"',udiyygkt)
            if ymdacrqu == -1: return {}
            var wvblotnm = elkqsjnh.find('"', ymdacrqu + 1)
            if wvblotnm == -1: return {}
            zpjynfso.append(elkqsjnh.substr(ymdacrqu + 1, wvblotnm - ymdacrqu - 1))
            udiyygkt = wvblotnm + 1
        
                                        
        var htvfpbyl = {}
        var aqmtqpgc = elkqsjnh.substr(udiyygkt).strip_edges()
        if aqmtqpgc.begins_with("{"):
            htvfpbyl = wyxanjzy.qcvmtljn(aqmtqpgc)
        
        return {
            "type": "add_existing_scene",
            "node_name": zpjynfso[0],
            "existing_scene_path": zpjynfso[1],
            "target_scene_path": zpjynfso[2],
            "parent_path": zpjynfso[3],
            "modifications": htvfpbyl
        }
    return {}
