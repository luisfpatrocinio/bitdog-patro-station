                                                       
@tool
extends CodeEdit

@onready var wuhqxcic: Button = $CopyButton

func _ready():
    wuhqxcic.connect("pressed",uymkasuo)

func uymkasuo():
    var dcyeqfgl = text
    if dcyeqfgl:
        DisplayServer.clipboard_set(dcyeqfgl)
