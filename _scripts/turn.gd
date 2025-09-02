extends Node2D

signal turn_over 

@export var sacrfice: int
@export var sacrfice_max: int

@onready var deck = $"../Deck"


func start_turn():
	sacrfice_max += 1
	sacrfice = sacrfice_max

	draw()
	play()
	end_turn()

func draw():
	deck.draw_card(deck.deck,1)

func play():
	pass

func end_turn():
	emit_signal("turn_over")


func _on_draw_pressed():
	start_turn()
