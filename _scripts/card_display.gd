extends Node2D

@export var card_resource: Card

@onready var texture_rect = $TextureRect

@export var hover_scale := Vector2(1.2,1.2)
var normal_scale := Vector2(1,1)
var original_position
var is_dragging = false
var current_drop_area: Area2D = null

func _ready():
	if card_resource:
		texture_rect.texture = card_resource.sprite
	original_position = position

func _process(delta):
	if is_dragging:
		global_position = get_global_mouse_position()

func _on_texture_rect_mouse_entered():
	_animate_scale(hover_scale)

func _on_texture_rect_mouse_exited():
	_animate_scale(normal_scale)

func _animate_scale(size):
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", size, 0.2)


func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if global_position.distance_to(get_global_mouse_position()) < 50:  # Adjust radius as needed
				is_dragging = true
		elif is_dragging:
			is_dragging = false
			_check_drop()

func _check_drop():
	if current_drop_area:
		global_position = current_drop_area.global_position
		print("Carta jugada en zona válida")
	else:
		_return_to_hand()
			
func _return_to_hand():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", original_position, 0.3)


func _on_area_2d_area_entered(area):
	if area is DropArea:
		current_drop_area = area
