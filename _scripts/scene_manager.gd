extends Node

var current_scene: Node = null

func _ready():
	current_scene = get_tree().current_scene

# Cambiar a una escena concreta
func level_changed(scene_name: String) -> void:
	var packed_scene = null
	match scene_name:
		"menu":
			packed_scene = load("res://scenes/map.tscn")
		"combat":
			packed_scene = load("res://scenes/event.tscn")
		"event":
			packed_scene = load("res://scenes/menu.tscn")
		"map":
			packed_scene = load("res://scenes/combat.tscn")
		_:
			return

	if packed_scene == null:
		push_error("No se pudo cargar la escena: " + scene_name)
		return

	var new_scene = packed_scene.instantiate()
	get_tree().root.add_child(new_scene)
	get_tree().current_scene = new_scene

	if current_scene:
		current_scene.queue_free()
	
	current_scene = new_scene
