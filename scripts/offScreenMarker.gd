extends Node2D

@onready var sprite = $Sprite2D


func _process(delta):
	sprite.global_position.x = get_node("../../player").global_position.x
	var bounds : Rect2
	sprite.global_position.y = clamp(global_position.y, bounds.position.y, bounds.end.y)


#func set_marker_position(bounds : Rect2):
#	sprite.global_position.x = clamp(global_position.x, bounds.position.x, bounds.end.x)
#	sprite.global_position.y = clamp(global_position.y, bounds.position.y, bounds.end.y)
#
#	if bounds.has_point(global_position):
#		hide()
#	else:
#		show()
