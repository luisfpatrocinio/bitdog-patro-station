                                                                    
@tool
extends TextEdit

@export var max_length = 1000                                        

func _ready():
    text_changed.connect(afhlaako)

func afhlaako():
    if text.length() > max_length:
                                  
        var rchbwfvq = get_caret_column()
        text = text.substr(0, max_length)
        set_caret_column(min(rchbwfvq, max_length))
