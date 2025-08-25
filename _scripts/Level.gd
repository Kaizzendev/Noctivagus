extends Node2D

signal level_changed(level_name)
@export var level_name = "menu"

func _ready():
	connect("level_changed", Callable(SceneManager, "level_changed"))

func _on_button_pressed():
	emit_signal("level_changed", level_name)
