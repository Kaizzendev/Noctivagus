extends Node
class_name Deck

var deck: Array[Node2D]
var times_drawed: int = 0

var deck_resources: Array[Card] = [
	preload("res://resources/trasno.tres"),
	preload("res://resources/trasno.tres"),
	preload("res://resources/trasno.tres"),
	preload("res://resources/trasno.tres"),
	preload("res://resources/trasno.tres"),
	preload("res://resources/trasno.tres"),
	preload("res://resources/trasno.tres"),
	preload("res://resources/trasno.tres"),
	preload("res://resources/trasno.tres"),
	preload("res://resources/trasno.tres")
]

func _ready():
	load_deck()

func load_deck():
	var card_scene = preload("res://scenes/card_display.tscn")
	
	for i in deck_resources.size():
		var card_instance = card_scene.instantiate() 
		card_instance.card_resource = deck_resources[i]
		deck.append(card_instance)

func draw_card(deck: Array[Node2D], times: int):
	for i in times:
		times_drawed +=1
		var card_instance = deck.pop_back()
		card_instance.position = Vector2(150 * times_drawed, 800)
		add_child(card_instance)
