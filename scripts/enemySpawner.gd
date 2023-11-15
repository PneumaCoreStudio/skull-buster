extends Node2D

@export var enemyType : PackedScene
@onready var enemySpawner = $"."


func _process(delta):
	Global.enemyCount = get_child_count()
	if Input.is_action_just_pressed("check"):
		spawn()


func spawn():
	if Input.is_action_just_pressed("check"):
		var enemy = enemyType.instantiate() as StaticBody2D
		get_tree().root.add_child(enemy)
		enemy.global_position = enemySpawner.global_position
		Global.enemyCount += 1
		print(Global.enemyCount)
