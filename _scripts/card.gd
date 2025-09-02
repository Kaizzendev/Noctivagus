@tool
extends Resource
class_name Card
enum Rarity {
	Common,
	Rare,
	Abonimable
}

enum Cost_type {
	Faith,
	Sacrifice,
	Mixed
}

@export var card_name: String 
@export var description: String 
@export var cost_type: Cost_type 
@export var cost_value: int 
@export var rarity: Rarity
@export var effects: Array
@export var sprite: Texture2D

func get_info() -> String:
	return "%s (%s %s) %s \n %s" % [card_name,description, cost_type, cost_value, rarity]

func play_card():
	pass
