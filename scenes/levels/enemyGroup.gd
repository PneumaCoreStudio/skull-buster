extends Node

func _ready():
	pass

func _process(delta):
	Global.enemyCount = get_child_count()
