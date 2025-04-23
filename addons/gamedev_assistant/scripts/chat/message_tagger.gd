                                                          
@tool
extends RefCounted

const gqaurxgq = "@OpenScripts"
const xlyprtdy = "@SceneTree"
const nlfltynn = "@FileTree"
const kpbmspxu = "@Output"
const ojdctxun = "@GitDiff"
const vsjwxesc = "@Docs"
const fegkmogp = 10000
const tcrjocje = 5000
const nurealac = 50000

var appjpuih = {}                                      
var braxrwyw = []                                     

                              
func kinpblfx() -> void:
    appjpuih.clear()
    braxrwyw.clear()

func zssmpsqh(caomlajh: String, njpimfuo: EditorInterface) -> String:
                                                         
    if not bapdrolo(caomlajh):
        return caomlajh
        
                            
    var ygdaebou = caomlajh
    
    if gqaurxgq in caomlajh:
                                      
        ygdaebou = gjjkiwxv(ygdaebou, njpimfuo)
        
    if xlyprtdy in caomlajh:
                                     
        ygdaebou = pyqgexym(ygdaebou, njpimfuo)

    if nlfltynn in caomlajh:
                                     
        ygdaebou = inmplfea(ygdaebou, njpimfuo)

    if kpbmspxu in caomlajh:
                                        
        ygdaebou = ipcaumvl(ygdaebou, njpimfuo)
    
    if ojdctxun in caomlajh:                                                             
        ygdaebou = qjykuxyy(ygdaebou, njpimfuo)      

    return ygdaebou

func bapdrolo(gzbmxcbu: String) -> bool:
                                  
    return gqaurxgq in gzbmxcbu or xlyprtdy in gzbmxcbu or nlfltynn in gzbmxcbu or kpbmspxu in gzbmxcbu

func gjjkiwxv(ccyrtpmu: String, szjqrdoo: EditorInterface) -> String:
    var ddhkbego = ccyrtpmu.replace(gqaurxgq, gqaurxgq.substr(1)).strip_edges()
    
    var zsfkcvus = fwfhoxqe(szjqrdoo)
    braxrwyw.clear()
    
                         
    var tgmffmyt = "\n[gds_context]\nScripts for context:\n"
    
    for file_path in zsfkcvus:
        var rleiflak = zsfkcvus[file_path]
        var xpayqiuf = rleiflak.md5_text()
        
        if appjpuih.has(file_path):
            if appjpuih[file_path] == xpayqiuf:
                braxrwyw.append(file_path)
                continue                        
                
                                
        appjpuih[file_path] = xpayqiuf
        
        tgmffmyt += "File: %s\nContent:\n```%s\n```\n" % [file_path, rleiflak]
    
                               
    if braxrwyw.size() > 0:
        tgmffmyt += "The following scripts remain the same: %s\n" % [braxrwyw]
    
                                
    if tgmffmyt.length() > nurealac:
        tgmffmyt = tgmffmyt.substr(0, nurealac) + "..."
    
    return ddhkbego + tgmffmyt + "\n[/gds_context]"

func fwfhoxqe(wmyrrrrw: EditorInterface) -> Dictionary:
    var ziscejml = wmyrrrrw.get_script_editor()
    var ofncqfvt: Array = ziscejml.get_open_scripts()
    
    var lgqojrnv: Dictionary = {}
    
    for script in ofncqfvt:
        var ydxxpdxg: String = script.get_source_code()
        var dpqdsbpd: String = script.get_path()
                                            
        lgqojrnv[dpqdsbpd] = ydxxpdxg
        
    return lgqojrnv

func pyqgexym(aonmnrhs: String, jcdtubpg: EditorInterface) -> String:
                                                                                                                          
    var qlstrvay = aonmnrhs.replace(xlyprtdy, xlyprtdy.substr(1)).strip_edges()
    
                               
    var bxjcnftg = jcdtubpg.get_edited_scene_root()
    if not bxjcnftg:
        return qlstrvay + "\n[gds_context]Node tree: No scene is currently being edited.[/gds_context]"
    
                                
    var nypnfdzn = "\n[gds_context]Node tree:\n"
    nypnfdzn += knscpswf(bxjcnftg)
    nypnfdzn += "--\n"

    if nypnfdzn.length() > fegkmogp:                                                            
        nypnfdzn = nypnfdzn.substr(0, fegkmogp) + "..."
        
    nypnfdzn += "\n[/gds_context]"
        
    return qlstrvay + nypnfdzn

func knscpswf(imngtugl: Node, qnftjfis: String = "") -> String:
    var cuxcsjxv = qnftjfis + "- " + imngtugl.name
    cuxcsjxv += " (" + imngtugl.get_class() + ")"
    
                                                                              
    if imngtugl.owner and imngtugl.owner != imngtugl:
        cuxcsjxv += " [owner: " + imngtugl.owner.name + "]"
    
    cuxcsjxv += "\n"
    var uiqbswxg = qnftjfis + "  "
    
                            
    var bfmpenhk = []
    for prop in imngtugl.get_property_list():
        var seaivxxe = prop["name"]
        var qykrmomw = imngtugl.get(seaivxxe)
        if qykrmomw is Resource and qykrmomw != null:
            var bqjlmmwg = qykrmomw.get_class()
            if qykrmomw.resource_name != "":
                bqjlmmwg = qykrmomw.resource_name
            bfmpenhk.append("%s (%s)" % [seaivxxe, bqjlmmwg])
        
    if not bfmpenhk.is_empty():
        cuxcsjxv += uiqbswxg + "Assigned subresources: " + ", ".join(bfmpenhk) + "\n"
    
                                       
    if imngtugl.get_script():
        cuxcsjxv += uiqbswxg + "Script: " + imngtugl.get_script().resource_path + "\n"
    
                            
    if imngtugl.unique_name_in_owner:
        cuxcsjxv += uiqbswxg + "Unique name: %" + imngtugl.name + "\n"
    
                
    var obqfrupq = imngtugl.get_groups()
    if not obqfrupq.is_empty():
                                                              
        obqfrupq = obqfrupq.filter(func(group): return not group.begins_with("_"))
        if not obqfrupq.is_empty():
            cuxcsjxv += uiqbswxg + "Groups: " + ", ".join(obqfrupq) + "\n"
    
                                           
    if imngtugl.scene_file_path:
        cuxcsjxv += uiqbswxg + "Instanced from: " + imngtugl.scene_file_path + "\n"
    
                      
    for child in imngtugl.get_children():
        cuxcsjxv += knscpswf(child, uiqbswxg)
    
    return cuxcsjxv

func inmplfea(ybbhrtpl: String, dflvsdht: EditorInterface) -> String:
                                                                                                                          
    var xmnxeyma = ybbhrtpl.replace(nlfltynn, nlfltynn.substr(1)).strip_edges()

    var ohcleatp = dflvsdht.get_resource_filesystem()
    var utcwxico = "res://"
    
                                
    var apwszekf = "\n[gds_context]\nFile Tree:\n"
    apwszekf += qydenkkh(ohcleatp.get_filesystem_path(utcwxico))
    apwszekf += "--\n"
    
    if apwszekf.length() > fegkmogp:                                                            
        apwszekf = apwszekf.substr(0, fegkmogp) + "..."
            
    apwszekf += "\n[/gds_context]"
    
    return xmnxeyma + apwszekf

func qydenkkh(jouqcbdj: EditorFileSystemDirectory, pnqbtovl: String = "") -> String:
    var tgabsvzl = ""
    
                                                          
    var ftkycphb = jouqcbdj.get_path()
    if ftkycphb == "res://addons/gamedev_assistant/":
                                
        var vezlossh = EditorInterface.get_editor_settings()
        var fusevsue = vezlossh.has_setting("gamedev_assistant/development_mode") and vezlossh.get_setting("gamedev_assistant/development_mode") == true
        if not fusevsue:
            return pnqbtovl + "+ gamedev_assistant/\n"                                            
    
                                                   
    if jouqcbdj.get_path() != "res://":
        tgabsvzl += pnqbtovl + "+ " + jouqcbdj.get_name() + "/\n"
        pnqbtovl += "  "
    
                                      
    for i in jouqcbdj.get_subdir_count():
        var wuxuduuc = jouqcbdj.get_subdir(i)
        tgabsvzl += qydenkkh(wuxuduuc, pnqbtovl)
    
    for i in jouqcbdj.get_file_count():
        var khkjonbj = jouqcbdj.get_file(i)
        tgabsvzl += pnqbtovl + "- " + khkjonbj + "\n"
    
    return tgabsvzl

func ipcaumvl(hjpglaui: String, xdoqcybx: EditorInterface) -> String:
                                                                                                                          
    var yhtnbilt = hjpglaui.replace(kpbmspxu, kpbmspxu.substr(1)).strip_edges()

                                                                                                       
    var coazqalo: Node = xdoqcybx.get_base_control()
    var iclftrul: RichTextLabel = gzrzxyqc(coazqalo)

    if iclftrul:
        var hmghrevm = iclftrul.get_parsed_text()
        
        if hmghrevm.length() > tcrjocje:                     
                                                                                            
            hmghrevm = hmghrevm.substr(-tcrjocje) + "..."
        
        if hmghrevm.length() > 0:
            return yhtnbilt + "\n[gds_context]\nOutput Panel:\n" + hmghrevm + "\n[/gds_context]"
        else:
            return yhtnbilt + "\n[gds_context]No contents in the Output Panel.[/gds_context]"
    else:
        print("No RichTextLabel under @EditorLog was found.")
        return yhtnbilt + "\n--\nOutput Panel: Could not find the label.\n--\n"


func gzrzxyqc(hozcflsm: Node) -> RichTextLabel:
                                              
    if hozcflsm is RichTextLabel:
        var speldzcg: Node = hozcflsm.get_parent()
        if speldzcg:
            var qcvbixhf: Node = speldzcg.get_parent()
                                                           
            if qcvbixhf and qcvbixhf.name.begins_with("@EditorLog"):
                return hozcflsm

                              
    for child in hozcflsm.get_children():
        var hsutyrdw: RichTextLabel = gzrzxyqc(child)
        if hsutyrdw:
            return hsutyrdw

    return null

func qjykuxyy(vnmwoyci: String, dullnoat: EditorInterface) -> String:         
                                                                                                                          
    var gicdumom = vnmwoyci.replace(ojdctxun, ojdctxun.substr(1)).strip_edges()
                                                                                                    
                                                                                                  
    var pduvqpai = []                                                                              
    var gdlbpeui = OS.execute("git", ["diff"], pduvqpai, true)                                    
                                                                                                    
    if gdlbpeui == 0:                                                                            
        var ubresdya = "\n[gds_context]\nGit Diff:\n" + "\n".join(pduvqpai) + "\n"  
        
        if ubresdya.length() > fegkmogp:                                                            
            ubresdya = ubresdya.substr(0, fegkmogp) + "..."
        
        ubresdya += "[/gds_context]"
        
        return gicdumom + ubresdya                                                
    else:                                                                                         
        return gicdumom + "\n--\nGit Diff: Failed to execute git diff command.\n--\n"

func sfybxhss(zezkszvt: String, iktsgzga: EditorInterface) -> String:
                                                                                                                          
    var zdagdisv = zezkszvt.replace(vsjwxesc, vsjwxesc.substr(1)).strip_edges()
    return zdagdisv
