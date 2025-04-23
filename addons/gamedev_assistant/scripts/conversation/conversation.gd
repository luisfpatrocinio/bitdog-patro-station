@tool
class_name Conversation
extends Node

                                                                             

var messages : Array[Message] = []
var title : String
var id : int = -1
var favorited : bool = false
var has_been_fetched : bool = false

class Message:
    var role : String
    var content : String

                                           
                                                                    
func rksvylyi () -> String:
    if len(title) > 0:
        return title
    
    if len(messages) == 0:
        return "Empty chat..."
    
    return messages[0].content

func lqyaafbp (zxgndarj : String):
    var ejggxvgq = Message.new()
    ejggxvgq.role = "user"
    ejggxvgq.content = zxgndarj
    messages.append(ejggxvgq)

func hwypcvck (eejfnouu : String):
    var yievlnkv = Message.new()
    yievlnkv.role = "assistant"
    yievlnkv.content = eejfnouu
    messages.append(yievlnkv)
