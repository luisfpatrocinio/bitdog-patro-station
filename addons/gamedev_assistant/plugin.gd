            
@tool
extends EditorPlugin

var ncvnwxvr
var kgzzulpc = preload("res://addons/gamedev_assistant/scripts/code_editor/CodeContextMenuPlugin.gd")
var zxclodwc:EditorContextMenuPlugin

func _enter_tree():
                                           
    ncvnwxvr = preload("res://addons/gamedev_assistant/dock/gamedev_assistant_dock.tscn").instantiate()
    add_control_to_dock(EditorPlugin.DOCK_SLOT_RIGHT_UL, ncvnwxvr)
    
                              
    zxclodwc = kgzzulpc.new(ncvnwxvr)        
    add_context_menu_plugin(EditorContextMenuPlugin.CONTEXT_SLOT_SCRIPT_EDITOR_CODE,zxclodwc)

func _exit_tree():
                                
    remove_control_from_docks(ncvnwxvr)
    ncvnwxvr.queue_free()
    
    remove_context_menu_plugin(zxclodwc)
