extends Node

var cards: Array[Card]

var deck_resources: Array[Card] = [
	preload("res://resources/trasno.tres"),
	preload("res://resources/trasno.tres"),
	preload("res://resources/trasno.tres"),
	preload("res://resources/trasno.tres")
]

func _ready():
	var card_scene = preload("res://scenes/card_display.tscn")
	
	for i in deck_resources.size():
		var card_instance = card_scene.instantiate() # Godot 4 usa `instantiate()` en lugar de `instance()`
		card_instance.card_resource = deck_resources[i]
		card_instance.position = Vector2(150 * i, 100)
		add_child(card_instance)
