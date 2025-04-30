extends Button
@export var sceneToTeleport: PackedScene;

func _ready() -> void:
	connect("pressed", teleporToScene);
	
func teleporToScene() -> void:
	get_tree().change_scene_to_packed(sceneToTeleport);
	
