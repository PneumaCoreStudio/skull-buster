extends Node2D
@onready var path_2d = $Path2D
@onready var path_follow_2d = $Path2D/PathFollow2D


func patrol():
	path_follow_2d.progress_ratio += .1
