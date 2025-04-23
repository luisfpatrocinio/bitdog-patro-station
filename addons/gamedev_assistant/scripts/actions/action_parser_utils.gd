                                                                  
@tool
extends Node

static func rjmikloa(wccbkwol: String) -> String:
    var rhscbiwr = wccbkwol.find('"')
    if rhscbiwr == -1:
        return ""
    var fbdnltba = wccbkwol.find('"', rhscbiwr + 1)
    if fbdnltba == -1:
        return ""
    return wccbkwol.substr(rhscbiwr + 1, fbdnltba - (rhscbiwr + 1))


static func pawprgmd(rewejpwf: String, tjlmzlus: String) -> String:
    var ifqkadmc = RegEx.new()
    ifqkadmc.compile("```.*\\n# New file: " + rewejpwf + "\\n([\\s\\S]*?)```")
    var tjepibzu = ifqkadmc.search(tjlmzlus)
    return tjepibzu.get_string(1).strip_edges() if tjepibzu else ""


static func fzufypyg(yojxkhxs: String) -> Array:
    var ktrvmcie = yojxkhxs.replace("create_scene(", "").replace(")", "").strip_edges()
    var exnizfoy = []
    var kfphcysl = 0
    while true:
        var nejxiidn = ktrvmcie.find('"',kfphcysl)
        if nejxiidn == -1:
            break
        var pqpqrrtl = ktrvmcie.find('"', nejxiidn + 1)
        if pqpqrrtl == -1:
            break
        exnizfoy.append(ktrvmcie.substr(nejxiidn + 1, pqpqrrtl - nejxiidn - 1))
        kfphcysl = pqpqrrtl + 1
    return exnizfoy


                                                     
static func nygpmfqr(vpqxtflk: String) -> Array:
    var mdkplths = vpqxtflk.replace("create_node(", "")
    
                                                                                                    
    var psmgxsod = mdkplths.rfind(")")
    if psmgxsod != -1:
        mdkplths = mdkplths.substr(0, psmgxsod)
    
    mdkplths = mdkplths.strip_edges()
    
                                                   
    var ztbsfhlg = mdkplths.find("{")
    if ztbsfhlg != -1:
        mdkplths = mdkplths.substr(0, ztbsfhlg).strip_edges()
    
    var cwiqhurd = []
    var bdxhxtno = 0
    while true:
        var beecmpvz = mdkplths.find('"',bdxhxtno)
        if beecmpvz == -1:
            break
        var igcqjfrp = mdkplths.find('"', beecmpvz + 1)
        if igcqjfrp == -1:
            break
        cwiqhurd.append(mdkplths.substr(beecmpvz + 1, igcqjfrp - beecmpvz - 1))
        bdxhxtno = igcqjfrp + 1
    return cwiqhurd


                                                                             
                   
                                                                             
static func tuhjxtkg(hqpjicoa: String) -> Dictionary:
                                 
    var mdrgtsna = hqpjicoa.replace("edit_node(", "")

                                    
    if mdrgtsna.ends_with(")"):
        mdrgtsna = mdrgtsna.substr(0, mdrgtsna.length() - 1)

                     
    mdrgtsna = mdrgtsna.strip_edges()

                                                                  
    var mplacgfm = []
    var dxwzokfx = 0
    while true:
        var kfghwqks = mdrgtsna.find('"',dxwzokfx)
        if kfghwqks == -1:
            break
        var yqhjqyzy = mdrgtsna.find('"', kfghwqks + 1)
        if yqhjqyzy == -1:
            break

        mplacgfm.append(mdrgtsna.substr(kfghwqks + 1, yqhjqyzy - kfghwqks - 1))
        dxwzokfx = yqhjqyzy + 1

                              
    var logspimx = mdrgtsna.find("{")
    var nksyadte = mdrgtsna.rfind("}")
    if logspimx == -1 or nksyadte == -1:
                                           
        return {}

    var mpdngsbj = mdrgtsna.substr(logspimx, nksyadte - logspimx + 1)

                                             
    var oaxrffdt = ""
    if mplacgfm.size() > 0:
        oaxrffdt = mplacgfm[0]

    var pmpbzbjz = ""
    if mplacgfm.size() > 1:
        pmpbzbjz = mplacgfm[1]

    return {
        "node_name": oaxrffdt,
        "scene_path": pmpbzbjz,
        "modifications": qcvmtljn(mpdngsbj)
    }


static func qcvmtljn(juhmyrsw: String) -> Dictionary:
                                                          
    var ifqeaiat = juhmyrsw.strip_edges()

                                    
    if ifqeaiat.begins_with("{"):
        ifqeaiat = ifqeaiat.substr(1, ifqeaiat.length() - 1)
                                     
    if ifqeaiat.ends_with("}"):
        ifqeaiat = ifqeaiat.substr(0, ifqeaiat.length() - 1)

                                      
    ifqeaiat = ifqeaiat.strip_edges()

                                                              
    var uoacdzjk = []
    var lskovear = ""
    var ddeohfmy = 0

    for i in range(ifqeaiat.length()):
        var jidyuesx = ifqeaiat[i]
        if jidyuesx == "(":
            ddeohfmy += 1
        elif jidyuesx == ")":
            ddeohfmy -= 1

        if jidyuesx == "," and ddeohfmy == 0:
            uoacdzjk.append(lskovear.strip_edges())
            lskovear = ""
        else:
            lskovear += jidyuesx

    if lskovear != "":
        uoacdzjk.append(lskovear.strip_edges())

                                 
    var rpwtiggx = {}
    for entry in uoacdzjk:
        var osmtcitr = entry.find(":")
        if osmtcitr == -1:
            continue

        var qireymro = entry.substr(0, osmtcitr).strip_edges()
        var oausapgg = entry.substr(osmtcitr + 1).strip_edges()

                                                                        
        if qireymro.begins_with("\"") and qireymro.ends_with("\"") and qireymro.length() >= 2:
            qireymro = qireymro.substr(1, qireymro.length() - 2)

        rpwtiggx[qireymro] = oausapgg

    return rpwtiggx
