                                                                  
@tool
extends Node

const mbxizuna = preload("action_parser_utils.gd")

static func execute(oybwnzxp: String, opgodbkl: String, otiaokxi: String) -> bool:
    var totkosqz = oybwnzxp.get_base_dir()
    if not DirAccess.dir_exists_absolute(totkosqz):
        DirAccess.make_dir_recursive_absolute(totkosqz)
    
    if !ClassDB.class_exists(otiaokxi): return false
    
    var pwcdexsi = PackedScene.new()
    var qmghtwco = ClassDB.instantiate(otiaokxi)
    qmghtwco.name = opgodbkl
    pwcdexsi.pack(qmghtwco)
    
    var njrppmtn = ResourceSaver.save(pwcdexsi, oybwnzxp)
    if njrppmtn == OK and Engine.is_editor_hint():
        EditorPlugin.new().get_editor_interface().get_resource_filesystem().scan()
    return njrppmtn == OK

static func parse_line(deehkgup: String, uykpkaxt: String) -> Dictionary:
    if deehkgup.begins_with("create_scene("):
        var wxkisueh = mbxizuna.fzufypyg(deehkgup)
        if wxkisueh.size() >= 3:
            return {
                "type": "create_scene",
                "path": wxkisueh[0],
                "root_name": wxkisueh[1],
                "root_type": wxkisueh[2]
            }
    return {}
