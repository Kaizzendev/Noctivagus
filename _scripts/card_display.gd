extends Node2D

@export var card_resource: Card

@onready var texture_rect = $TextureRect

func _ready():
	if card_resource:
		texture_rect.texture = card_resource.sprite
