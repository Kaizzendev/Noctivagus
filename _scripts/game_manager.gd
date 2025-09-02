extends Node

var player_turn: bool = false

var turn_counter: int = 0

var player_deck

func next_turn():
	
	turn_counter += 1
	player_turn = !player_turn
	
	if player_turn:
		turn.deck = player_deck
		print("Turno del jugador")
	else:
		turn.deck = enemy_deck
		print("Turno del enemigo")

	turn.sta
	#comprobar_victoria()
