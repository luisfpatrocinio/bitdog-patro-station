                                                                 
@tool
extends Node

const fvrwcihc = preload("action_parser_utils.gd")

static func execute(isolddmi: String, jumlplqr: String) -> bool:
    var nasdftac = isolddmi.get_base_dir()
    if not DirAccess.dir_exists_absolute(nasdftac):
        DirAccess.make_dir_recursive_absolute(nasdftac)
    
    var piswaumx = FileAccess.open(isolddmi, FileAccess.WRITE)
    if piswaumx:
        piswaumx.store_string(jumlplqr)
        piswaumx.close()
        if Engine.is_editor_hint():
            EditorPlugin.new().get_editor_interface().get_resource_filesystem().scan()
        return true
    return false

static func parse_line(evaxsurw: String, uaqsgjnw: String) -> Dictionary:
    if evaxsurw.begins_with("create_file("):
        var ppyaivlo = fvrwcihc.rjmikloa(evaxsurw)
        return {
            "type": "create_file",
            "path": ppyaivlo,
            "content": fvrwcihc.pawprgmd(ppyaivlo, uaqsgjnw)
        }
    return {}
