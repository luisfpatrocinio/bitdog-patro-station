                         
@tool
extends Node

                                                 
                                      
                                   

signal vwvuomtd (validated : bool, error : String)

signal fjmblogx(update_available: bool, latest_version: String)
signal shaftxdb(error: String)

signal hbnhgtjd (message : String, conv_id : int)
signal onmciohk (error : String)
signal gvrlnhwm (message : String)

signal aftyyapf (data)
signal yfmksvsf (error : String)

signal fpefpohp (data)
signal ywjabcpl (error : String)

signal ipwuqykf ()
signal nrscnyoq (error : String)

signal dcfkdnwu ()
signal lklgifyd (error : String)

signal ftevlpyf

const tatnftor = 30

              
signal fgzfdoib(content: String, conv_id: int, message_id: int)
signal weenvsvx(conv_id: int, message_id: int)
signal ltjatavb(conv_id: int, message_id: int)
signal srsylxgj(error: String)
var zjmqpnxj : HTTPClient
var xwnsqlvo = false
var nvgpitse = ""

var cktfgsut : String
var hudquizi : String
var zrzgvfou : String
var vezmrvek : String
var yrjmodad : String
var gfscyddo : String
var fpdalkuc : String
var rfvoltmp : String

var pxpdjbqh : String:
    get:
        var cjebeyme = EditorInterface.get_editor_settings()
        var hhjaptev = "null"
        var ykdsjjza : bool = cjebeyme.has_setting("gamedev_assistant/development_mode") and cjebeyme.get_setting('gamedev_assistant/development_mode') == true
        
        if not ykdsjjza and cjebeyme.has_setting("gamedev_assistant/token"):
            return cjebeyme.get_setting("gamedev_assistant/token")
        elif ykdsjjza and cjebeyme.has_setting("gamedev_assistant/token_dev"):        
            return cjebeyme.get_setting("gamedev_assistant/token_dev")
                    
        return hhjaptev

var dbvvoqyd = ["Content-type: application/json", "Authorization: Bearer " + pxpdjbqh]

@onready var tsgmkjwk = $"../ConversationManager"

@onready var nkupxxfi : HTTPRequest = $ValidateToken
@onready var tgwdrxko : HTTPRequest = $SendMessage
@onready var tmsdblri : HTTPRequest = $GetConversationsList
@onready var fazchhec : HTTPRequest = $GetConversation
@onready var gxnyasjz : HTTPRequest = $DeleteConversation
@onready var muubnjbf : HTTPRequest = $ToggleFavorite
@onready var anymiwit : HTTPRequest = $CheckUpdates
@onready var qqzdqosi : HTTPRequest = $TrackAction
@onready var slgowfix : HTTPRequest = $RatingAction


var ikkbzmwz = []

func _ready ():
                                      
    zjmqpnxj = HTTPClient.new()
    
    nkupxxfi.timeout = tatnftor                                         
    tgwdrxko.timeout = tatnftor                                           
    tmsdblri.timeout = tatnftor                                 
    fazchhec.timeout = tatnftor                                       
    gxnyasjz.timeout = tatnftor                                    
    muubnjbf.timeout = tatnftor
    anymiwit.timeout = tatnftor
    
    nkupxxfi.request_completed.connect(jcpzftbg)
    tgwdrxko.request_completed.connect(ksvkxryb)
    tmsdblri.request_completed.connect(hzzxotgx)
    fazchhec.request_completed.connect(fckptkuc)
    gxnyasjz.request_completed.connect(ifijhdvm)
    muubnjbf.request_completed.connect(qrvuberc)
    anymiwit.request_completed.connect(qvilvnyw)
    
    ftevlpyf.connect(neomidet)  
    
    zxgifzjd ()
    

func zxgifzjd ():
    var seicibwt = EditorInterface.get_editor_settings()            
    if seicibwt.has_setting("gamedev_assistant/endpoint"):          
        cktfgsut = seicibwt.get_setting("gamedev_assistant/endpoint")    
        hudquizi = cktfgsut + "/token/validate"                
        zrzgvfou = cktfgsut + "/chat/message"                         
        vezmrvek = cktfgsut + "/chat/conversations"        
        yrjmodad = cktfgsut + "/chat/conversation/"
        gfscyddo = cktfgsut + "/chat/checkForUpdates"
        fpdalkuc = cktfgsut + "/chat/track-action"
        rfvoltmp = cktfgsut + "/chat/track-rating"

func wxhowava ():
    return ["Content-type: application/json", "Authorization: Bearer " + pxpdjbqh]

func wvlrtgys ():
    var akijvepn = nkupxxfi.request(hudquizi, wxhowava(), HTTPClient.METHOD_GET)

func sjthcloa(yrmmejjh: String, hkqbslyx: bool, wfcsprit: String) -> void:
    
    tgwdrxko.timeout = tatnftor
    
                           
    xwnsqlvo = false
    nvgpitse = ""
    
                                
    var hyysykso = cktfgsut.begins_with("https://")
    var ayiktlhj = cktfgsut.replace("http://", "").replace("https://", "")
    
                                       
    var dlqbfevr = -1
    if ayiktlhj.begins_with("localhost:"):
        var bruvyhep = ayiktlhj.split(":")
        ayiktlhj = bruvyhep[0]
        dlqbfevr = int(bruvyhep[1])
    
                                                                            
    
    var xlvoiygc: Error
    if hyysykso:
        xlvoiygc = zjmqpnxj.connect_to_host(ayiktlhj, dlqbfevr, TLSOptions.client())
    else:
        xlvoiygc = zjmqpnxj.connect_to_host(ayiktlhj, dlqbfevr)
        
    if xlvoiygc != OK:
        srsylxgj.emit("Failed to connect: " + str(xlvoiygc))
        return

    xwnsqlvo = true
    
                             
    var nqexsnyx = EditorInterface.get_editor_settings()
    var aeoydczx = nqexsnyx.get_setting("gamedev_assistant/version_identifier")
    
    var xnymxsce = Engine.get_version_info()
    var ufsvmzzn = "%d.%d" % [xnymxsce.major, xnymxsce.minor]
    
                                           
    var gaeuapfw = ""
    if nqexsnyx.has_setting("gamedev_assistant/custom_instructions"):
        gaeuapfw = nqexsnyx.get_setting("gamedev_assistant/custom_instructions")
    
    
                              
    var pdpfbxdb = { 
        "content": yrmmejjh, 
        "useThinking": hkqbslyx,
        "releaseUniqueIdentifier": aeoydczx,
        "godotVersion": ufsvmzzn,
        "mode": wfcsprit,
        "customInstructions": gaeuapfw
    }
    
    var hkpsudhb = tsgmkjwk.giyoxwty()
    
    if hkpsudhb and hkpsudhb.id > 0:
        pdpfbxdb["conversationId"] = hkpsudhb.id
        
                                                            
    
                                                
    lknuceig(pdpfbxdb)
    
    gvrlnhwm.emit(yrmmejjh)

func tdupyxtf ():
    var kwdnojmr = tmsdblri.request(vezmrvek, wxhowava(), HTTPClient.METHOD_GET)

func get_conversation (zzivrwzn : int):
    var wsaqbfip = yrjmodad + str(zzivrwzn)
    var vrkfwrhy = fazchhec.request(wsaqbfip, wxhowava(), HTTPClient.METHOD_GET)

func wcykpreh (mgunrslk : int):
    var dbyhctyh = yrjmodad + str(mgunrslk)
    var cllaxzkp = gxnyasjz.request(dbyhctyh, wxhowava(), HTTPClient.METHOD_DELETE)

func ngdywheh (cmybltxa : int):
    var kunaehlc = yrjmodad + str(cmybltxa) + "/toggle-favorite"
    var kzjbxqxv = muubnjbf.request(kunaehlc, wxhowava(), HTTPClient.METHOD_POST)

func jcpzftbg(vnqauzfz: int, jywkluij: int, ezhbrhas: PackedStringArray, naculfzr: PackedByteArray):
                                
    if vnqauzfz != HTTPRequest.RESULT_SUCCESS:
        vwvuomtd.emit(false, "Network error (Code: " + str(vnqauzfz) + ")")
        return
        
    var sktgomeu = sugjcxfy(naculfzr)
    if not sktgomeu is Dictionary:
        vwvuomtd.emit(false, "Response error (Code: " + str(jywkluij) + ")")
        return
        
    var igneektl = sktgomeu.get("success", false)
    var mpxprwod = sktgomeu.get("error", "Response code: " + str(jywkluij))
    
    vwvuomtd.emit(igneektl, mpxprwod)

                                                     
func ksvkxryb(isahjopu, knyhnral, cdfzbdbr, pbsptvqu):
    
    if isahjopu != HTTPRequest.RESULT_SUCCESS:
        onmciohk.emit("Network error (Code: " + str(isahjopu) + ")")
        return
        
    var mvcdffes = sugjcxfy(pbsptvqu)
    if not mvcdffes is Dictionary:
        onmciohk.emit("Response error (Code: " + str(knyhnral) + ")")
        return
    
    if knyhnral == 201:
        var rabqeogb = mvcdffes.get("content", "")
        var kmcxdoqc = int(mvcdffes.get("conversationId", -1))
        hbnhgtjd.emit(rabqeogb, kmcxdoqc)
    else:
        onmciohk.emit(mvcdffes.get("error", "Response code: " + str(knyhnral)))

                                                                    
func hzzxotgx(gejlyoxw, ewksexrx, usmzkayi, gzfequed):
    if gejlyoxw != HTTPRequest.RESULT_SUCCESS:
        yfmksvsf.emit("Network error (Code: " + str(gejlyoxw) + ")")
        return
        
    var arqsiwsi = sugjcxfy(gzfequed)
    
    if ewksexrx == 200:
        aftyyapf.emit(arqsiwsi)
    else:
        if arqsiwsi is Dictionary:
            yfmksvsf.emit(arqsiwsi.get("error", "Response code: " + str(ewksexrx)))
        else:
            yfmksvsf.emit("Response error (Code: " + str(ewksexrx) + ")")

                                                                
func fckptkuc(ebgefzud, pazgnygp, rwoustne, jdlotjpq):
    if ebgefzud != HTTPRequest.RESULT_SUCCESS:
                                                              
        printerr("[GameDev Assistant] Get conversation network error (Code: " + str(ebgefzud) + ")")
        return
        
    var wynqqlxn = sugjcxfy(jdlotjpq)
    if not wynqqlxn is Dictionary:
        printerr("[GameDev Assistant] Get conversation response error (Code: " + str(pazgnygp) + ")")
        return
        
    fpefpohp.emit(wynqqlxn)

                                                                                         
func ifijhdvm(ncgcmdvl, hsftieye, dcyimhgb, efyccglm):
    if ncgcmdvl != HTTPRequest.RESULT_SUCCESS:
                                                                          
        printerr("[GameDev Assistant] Delete conversation network error (Code: " + str(ncgcmdvl) + ")")
        return
        
    if hsftieye == 204:
        ipwuqykf.emit()
    else:
        var ktnyusyd = sugjcxfy(efyccglm)
        var uibxdovr = "[GameDev Assistant] Response code: " + str(hsftieye)
        if ktnyusyd is Dictionary:
            uibxdovr = ktnyusyd.get("error", uibxdovr)
        nrscnyoq.emit(uibxdovr)

                                                                                                       
func qrvuberc(yuqwchez, tcoworoa, dzmqkcrf, lsgrrfmz):
    if yuqwchez != HTTPRequest.RESULT_SUCCESS:
                                                                      
        printerr("[GameDev Assistant] Toggle favorite network error (Code: " + str(yuqwchez) + ")")
        return
        
    if tcoworoa == 200:
        dcfkdnwu.emit()
    else:
        var weuoutws = sugjcxfy(lsgrrfmz)
        var gyxsihok = "[GameDev Assistant] Response code: " + str(tcoworoa)
        if weuoutws is Dictionary:
            gyxsihok = weuoutws.get("error", gyxsihok)
        lklgifyd.emit(gyxsihok)

func sugjcxfy (sjrajcfw):
    var xvxsyzoa = JSON.new()
    var eoxezdpu = xvxsyzoa.parse(sjrajcfw.get_string_from_utf8())
    if eoxezdpu != OK:
        return null
    return xvxsyzoa.get_data()

func lknuceig(anktsuhs: Dictionary) -> void:
    while xwnsqlvo:
        zjmqpnxj.poll()
        
        match zjmqpnxj.get_status():
            HTTPClient.STATUS_CONNECTION_ERROR:
                srsylxgj.emit("Connection error")
                neomidet()
                return
            HTTPClient.STATUS_DISCONNECTED:
                srsylxgj.emit("Disconnected")
                neomidet()
                return
            
            HTTPClient.STATUS_CONNECTED:
                ynvgafgw(anktsuhs)
                
            HTTPClient.STATUS_BODY:
                tepspjwg()
        
        await get_tree().process_frame

func ynvgafgw(ddfbvkkf: Dictionary) -> void:
    var bmztetba = JSON.new()
    var osqgdnxw = bmztetba.stringify(ddfbvkkf)
    var srqbuoqk = PackedStringArray([
        "Content-Type: application/json",
        "Authorization: Bearer " + pxpdjbqh
    ])
    
    var zkgmfvoz = zjmqpnxj.request(
        HTTPClient.METHOD_POST,
        zrzgvfou.replace(cktfgsut, ""),                                        
        srqbuoqk,
        osqgdnxw
    )
    
    if zkgmfvoz != OK:
        srsylxgj.emit("Failed to send request: " + str(zkgmfvoz))
        xwnsqlvo = false

func tepspjwg() -> void:
    while zjmqpnxj.get_status() == HTTPClient.STATUS_BODY:
        var wwxttdsw = zjmqpnxj.read_response_body_chunk()
        if wwxttdsw.size() == 0:
            break
            
        nvgpitse += wwxttdsw.get_string_from_utf8()
        
        rhkeaqby()

func rhkeaqby() -> void:
    
    var qpqqimde
    var ozbdsvna
    var uzcujcal
    
    if zjmqpnxj.get_response_code() != 200:
        xwnsqlvo = false
        
        qpqqimde = JSON.new()
        ozbdsvna = qpqqimde.parse(nvgpitse)
        
        if ozbdsvna == OK:
            uzcujcal = qpqqimde.get_data()
            if uzcujcal.has("error"):                
                srsylxgj.emit(uzcujcal["error"])
            elif uzcujcal.has("message"):                
                srsylxgj.emit(uzcujcal["message"])
            else:
                srsylxgj.emit("Unknown server error, please try again later")
        else: 
            srsylxgj.emit("Unknown server error")
    
    var avsqkfhr = nvgpitse.split("\n\n")
    
                                                                                 
    for i in range(avsqkfhr.size() - 1):
        var hcjttytv: String = avsqkfhr[i]
        if hcjttytv.find("data:") != -1:
            var doyrtiyc = hcjttytv.split("\n")
            for line in doyrtiyc:
                if line.begins_with("data:"):
                    var ghxztuvi = line.substr(5).strip_edges()
                                                               
                    
                    qpqqimde = JSON.new()
                    ozbdsvna = qpqqimde.parse(ghxztuvi)
                    
                    if ozbdsvna == OK:
                        uzcujcal = qpqqimde.get_data()
                        
                        if uzcujcal is Dictionary:
                            if uzcujcal.has("error"):
                                printerr("Server error: ", uzcujcal["error"])
                                srsylxgj.emit(uzcujcal["error"])
                                neomidet()
                                return
                            
                            if uzcujcal.has("done") and uzcujcal["done"] == true:
                                xwnsqlvo = false
                                                                
                                weenvsvx.emit(
                                    int(uzcujcal.get("conversationId", -1)),
                                    int(uzcujcal.get("messageId", -1))
                                )
                                neomidet()
                                
                            elif uzcujcal.has("beforeActions"):
                                ltjatavb.emit(
                                    int(uzcujcal.get("conversationId", -1)),
                                    int(uzcujcal.get("messageId", -1))
                                )
                                
                            elif uzcujcal.has("content"):
                                
                                if (typeof(uzcujcal.get("messageId")) != TYPE_INT and typeof(uzcujcal.get("messageId")) != TYPE_FLOAT) or (typeof(uzcujcal.get("conversationId")) != TYPE_INT and typeof(uzcujcal.get("conversationId")) != TYPE_FLOAT):
                                    print(uzcujcal.get("messageId"))
                                    print(uzcujcal.get("conversationId"))
                                    
                                    srsylxgj.emit("Invalid data coming from the server")
                                    neomidet()
                                    return                                   
                            
                                fgzfdoib.emit(
                                    str(uzcujcal["content"]),
                                    int(uzcujcal.get("conversationId", -1)),
                                    int(uzcujcal.get("messageId", -1))
                                )
                        
                                               
    nvgpitse = avsqkfhr[avsqkfhr.size() - 1]
    
func neomidet():  
    xwnsqlvo = false  
    zjmqpnxj.close()            

                                                                  
func abitjwod(kmrhbrvw: bool = false):
    var tsmgwyqn = EditorInterface.get_editor_settings()       
    var goukmzmd = tsmgwyqn.get_setting("gamedev_assistant/version_identifier")
    
    var bozeewrz = {
        "releaseUniqueIdentifier": goukmzmd,
        "isInit": kmrhbrvw
    }
    var yjoohvki = JSON.new()
    var urmzvwxc = yjoohvki.stringify(bozeewrz)
    var yqmcydhp = anymiwit.request(gfscyddo, wxhowava(), HTTPClient.METHOD_POST, urmzvwxc)

                                            
func qvilvnyw(kldgruhn, rthjgaka, azoilggz, lslnhtwh):
    if kldgruhn != HTTPRequest.RESULT_SUCCESS:
        shaftxdb.emit("[GameDev Assistant] Network error when checking for updates (Code: " + str(kldgruhn) + ")")
        return
        
    var aoazpzcz = sugjcxfy(lslnhtwh)
    if not aoazpzcz is Dictionary:
        shaftxdb.emit("[GameDev Assistant] Response error when checking for updates (Code: " + str(rthjgaka) + ")")
        return
    
    if rthjgaka == 200:
        var afxkzvtn = aoazpzcz.get("updateAvailable", false)
        var lrtbvubb = aoazpzcz.get("latestVersion", "")
        
        fjmblogx.emit(afxkzvtn, lrtbvubb)
    else:
        shaftxdb.emit(aoazpzcz.get("error", "Response code: " + str(rthjgaka)))

func syzzmsal(dttwurio: int, qtpfhsds: bool, xlgbrvto: String):
    var vsvkbinu = {
        "messageId": dttwurio,
        "success": qtpfhsds,
        "action_type": xlgbrvto
    }
    ikkbzmwz.append(vsvkbinu)
    lmgyislk()

                             
func lmgyislk():
    var client_status = qqzdqosi.get_http_client_status()
                                                                                      
    if (client_status == HTTPClient.STATUS_DISCONNECTED or 
        client_status == HTTPClient.STATUS_CANT_RESOLVE or 
        client_status == HTTPClient.STATUS_CANT_CONNECT or 
        client_status == HTTPClient.STATUS_CONNECTION_ERROR or 
        client_status == HTTPClient.STATUS_TLS_HANDSHAKE_ERROR) and ikkbzmwz.size() > 0:
        
        var ibohfyvp = ikkbzmwz.pop_front()
        var ewukfotn = JSON.new()
        var btpupvqz = ewukfotn.stringify(ibohfyvp)
        var rypeqgaw = wxhowava()
        var htiityuy = qqzdqosi.request(fpdalkuc, rypeqgaw, HTTPClient.METHOD_POST, btpupvqz)
        if htiityuy != OK:
            printerr("Failed to start track action request:", htiityuy)
            lmgyislk()                                  

func sijswhfp(ouukrkfg, odteamfw, foncjbzh, rlagjbyg):
    lmgyislk()                                      
    if ouukrkfg != HTTPRequest.RESULT_SUCCESS:
        printerr("[GameDev Assistant] Track action failed:", ouukrkfg)
        return
        
    var azukpdnx = sugjcxfy(rlagjbyg)
    if not azukpdnx is Dictionary:
        printerr("[GameDev Assistant] Invalid track action response")

func nkhhfsaa(embhxtbg: int, hpxcpsjr: int) -> void:
    var tbwpzrcw = {
        "messageId": embhxtbg,
        "rating": hpxcpsjr
    }
    var iexjczpa = JSON.new()
    var woaxmyyb = iexjczpa.stringify(tbwpzrcw)
    var jtodfjpp = wxhowava()
    var hzjxvkss = slgowfix.request(rfvoltmp, jtodfjpp, HTTPClient.METHOD_POST, woaxmyyb)
    if hzjxvkss != OK:
        printerr("[GameDev Assistant] Failed to track rating:", hzjxvkss)

                                          
func mjnijrne(ikhsjjea, haychuso, urbxcqpw, qpqtyney):
    if ikhsjjea != HTTPRequest.RESULT_SUCCESS:
        printerr("[GameDev Assistant] Rating action failed:", ikhsjjea)
        return
        
    var kwcglcwb = sugjcxfy(qpqtyney)
    if not kwcglcwb is Dictionary:
        printerr("[GameDev Assistant] Invalid rating response")
        return

func ofhepacf():
    return xwnsqlvo
