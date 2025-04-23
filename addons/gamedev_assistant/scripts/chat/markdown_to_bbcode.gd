                                                              
@tool
class_name MarkdownToBBCode
extends RefCounted

const wanvidhx = [
    "b", "i", "u", "s", "code", "char", "p", "center", "left", "right", "fill",
    "indent", "url", "hint", "img", "font", "font_size", "dropcap",
    "opentype_features", "lang", "color", "bgcolor", "fgcolor", "outline_size",
    "outline_color", "table", "cell", "ul", "ol", "lb", "rb", "lrm", "rlm",
    "lre", "rle", "lro", "rlo", "pdf", "alm", "lri", "rli", "fsi", "pdi",
    "zwj", "zwnj", "wj", "shy"
]


                                                                    
                              
                                                                
                                                                    
static func sgoqhvfo(icsgczwg: Array, jfddcnyp: String) -> String:
    var ngftujmf = ""
    for i in range(icsgczwg.size()):
        if i > 0:
            ngftujmf += jfddcnyp
        ngftujmf += str(icsgczwg[i])
    return ngftujmf


                                                                    
                                     
 
                                
                                                              
                                                                         
                                                                    
static func ubcfcbbi(lfwatfot: String) -> String:
    var dyjjoxda = lfwatfot.split("\n")
    var ntnrwhpc = []
    var zoelying = false
    var mbescfab = []
    var wytslyem = []

    for line in dyjjoxda:
        var gftbiskb = line.strip_edges(true, false)                       

        if gftbiskb.begins_with("```"):
            if zoelying:
                                
                var zbedjvbo = sgoqhvfo(mbescfab, "\n")
                zbedjvbo = ealgqrrv(zbedjvbo)

                                                       
                if wytslyem.size() > 0:
                    var tcisfmwo = sgoqhvfo(wytslyem, "\n")
                    tcisfmwo = ealgqrrv(tcisfmwo)
                    tcisfmwo = ujhlrxnt(tcisfmwo)
                    ntnrwhpc.append(tcisfmwo)
                    wytslyem.clear()

                ntnrwhpc.append("\n[table=1]\n[cell bg=#000000]\n[code]" + zbedjvbo + "[/code]\n[/cell]\n[/table]\n")
                mbescfab.clear()
                zoelying = false
            else:
                                  
                if wytslyem.size() > 0:
                    var gvnaeylj = sgoqhvfo(wytslyem, "\n")
                    gvnaeylj = ealgqrrv(gvnaeylj)
                    gvnaeylj = ujhlrxnt(gvnaeylj)
                    ntnrwhpc.append(gvnaeylj)
                    wytslyem.clear()
                zoelying = true
        elif zoelying:
            mbescfab.append(line)
        else:
            wytslyem.append(line)

                                 
    if zoelying and mbescfab.size() > 0:
                             
        var sbjhaims = sgoqhvfo(mbescfab, "\n")
        sbjhaims = ealgqrrv(sbjhaims)
        var fdbdotfx = eirqzumt(sbjhaims)
        ntnrwhpc.append("[p][/p][table=1]\n[cell bg=#000000]\n[code]" + fdbdotfx + "[/code]\n[/cell]\n[/table]")
    elif wytslyem.size() > 0:
        var qkwaqiof = sgoqhvfo(wytslyem, "\n")
        qkwaqiof = ealgqrrv(qkwaqiof)
        qkwaqiof = ujhlrxnt(qkwaqiof)
        ntnrwhpc.append(qkwaqiof)

    return sgoqhvfo(ntnrwhpc, "\n")


                                                                    
                                         
 
                                                    
                                                                                  
                                                                            
                                                                    
static func rkmtdxdx(mwtewspv: String) -> Array:
    var dpuyxmlo = []
    var etbzxcny = mwtewspv.split("\n")

    var zaapypix = false
    var ttcrfoza = []
    var coqsstra = []

    for line in etbzxcny:
        var ugbocudj = line.strip_edges()

        if ugbocudj.begins_with("```"):
            if zaapypix:
                                    
                var pasnabvu = sgoqhvfo(coqsstra, "\n")
                dpuyxmlo.append({ "type": "code", "content": pasnabvu })
                coqsstra.clear()
                zaapypix = false
            else:
                                    
                if ttcrfoza.size() > 0:
                    var vulsmefs = sgoqhvfo(ttcrfoza, "\n")
                    dpuyxmlo.append({ "type": "text", "content": vulsmefs })
                    ttcrfoza.clear()
                zaapypix = true
        elif zaapypix:
            coqsstra.append(line)
        else:
            ttcrfoza.append(line)

                                      
    if ttcrfoza.size() > 0:
        var kmwdvweu = sgoqhvfo(ttcrfoza, "\n")
        dpuyxmlo.append({ "type": "text", "content": kmwdvweu })
    elif zaapypix and coqsstra.size() > 0:
        var hrcgvcfo = sgoqhvfo(coqsstra, "\n")
        dpuyxmlo.append({ "type": "code", "content": hrcgvcfo })

    return dpuyxmlo


                             
                           
                             

static func eirqzumt(ityxlhqe: String) -> String:
    var glxxfugn = ityxlhqe.split("\n")
    var ztomtgpo = 0
    
                           
    for line in glxxfugn:
        ztomtgpo = max(ztomtgpo, line.length())
    
                                    
    for i in range(glxxfugn.size()):
        var yblrkpie = "  "
        var qyfkwngn = "  "
        glxxfugn[i] = yblrkpie + glxxfugn[i] + qyfkwngn
    
    return sgoqhvfo(glxxfugn, "\n") + "\n"


static func ujhlrxnt(znxweaub: String) -> String:
    var irxrnegv = znxweaub
    var papvsopx = irxrnegv.split("\n")
    var jizglqvk = []

    for line in papvsopx:
                        
        if line.begins_with("## "):
            line = "[font_size=22][b]" + line.substr(3) + "[/b][/font_size]"
        elif line.begins_with("### "):
            line = "[font_size=18][b]" + line.substr(4) + "[/b][/font_size]"
        elif line.begins_with("#### "):
            line = "[font_size=16][b]" + line.substr(4) + "[/b][/font_size]"
        
               
        line = dzsbzsyl(line)
        jizglqvk.append(line)

    irxrnegv = sgoqhvfo(jizglqvk, "\n")

                               
    var pglobcka = irxrnegv.split("***")
    irxrnegv = ""
    for i in range(pglobcka.size()):
        irxrnegv += pglobcka[i]
        if i < pglobcka.size() - 1:
            if i % 2 == 0:
                irxrnegv += "[b][i]"
            else:
                irxrnegv += "[/i][/b]"

                           
    var reqeukex = irxrnegv.split("**")
    var slfilmfm = ""
    for i in range(reqeukex.size()):
        slfilmfm += reqeukex[i]
        if i < reqeukex.size() - 1:
            if i % 2 == 0:
                slfilmfm += "[b]"
            else:
                slfilmfm += "[/b]"
    irxrnegv = slfilmfm

                           
    var oompbznu = RegEx.new()
    oompbznu.compile("(?<![\\s])(\\*)(?![\\s])([^\\*]+?)(?<![\\s])\\*(?![\\s])")
    irxrnegv = oompbznu.sub(irxrnegv, "[i]$2[/i]", true)
    
    return irxrnegv

static func sbnphglc(rdakfyiz: String, zntqbegc: String, strnogzv: int) -> bool:
    var wbxbvlrl = strnogzv + rdakfyiz.length()
    while wbxbvlrl < zntqbegc.length():
        var akuyjihw = zntqbegc[wbxbvlrl]
        if akuyjihw == "(":
            return true
        elif akuyjihw == " " or akuyjihw == "\t":
            wbxbvlrl += 1
        else:
            return false
    return false


static func ctqiumzc(owyirawi: String, wfgvwwuw: Color) -> String:
    return "[wfgvwwuw =#" + wfgvwwuw.to_html(false) + "]" + owyirawi + "[/color]"


static func ealgqrrv(szmoljyu: String) -> String:
    var nvdbcldt = szmoljyu
    var vmwdnrmn = RegEx.new()
    vmwdnrmn.compile("\\[(/?)(\\w+)((?:[= ])[^\\]]*)?\\]")

    var iuyhhroj = vmwdnrmn.search_all(nvdbcldt)
    iuyhhroj.reverse()
    for match in iuyhhroj:
        var dnavtutx = match.get_string()
        var cdciqabr = match.get_string(2).to_lower()
        if cdciqabr in wanvidhx:
            var eqxecgvw = match.get_start()
            var rkkqyudp = match.get_end()
            var efwgikon = ""
            for c in dnavtutx:
                if c == "[":
                    efwgikon += "[lb]"
                elif c == "]":
                    efwgikon += "[rb]"
                else:
                    efwgikon += c
            nvdbcldt = nvdbcldt.substr(0, eqxecgvw) + efwgikon + nvdbcldt.substr(rkkqyudp)

    return nvdbcldt


static func dzsbzsyl(csiztidg: String) -> String:
    var lfozobgm = RegEx.new()
                                      
    lfozobgm.compile("\\[(.+?)\\]\\((.+?)\\)")
    var diupojvp = csiztidg
    var fkaibxsm = lfozobgm.search_all(csiztidg)
    fkaibxsm.reverse()
    for match in fkaibxsm:
        var yyluayfx = match.get_string()
        var bwzvfbmk = match.get_string(1)
        var flyhmbml = match.get_string(2)
                             
        var aemyqeud = "[url=%s]%s[/url]" % [flyhmbml, bwzvfbmk]
        diupojvp = diupojvp.substr(0, match.get_start()) + aemyqeud + diupojvp.substr(match.get_end())
    return diupojvp
