extends Node2D

@export var basicEnemy : PackedScene
@export var bombEnemy : PackedScene
@onready var enemySpawner = $"."
@export var enemyGroup : Node2D
@export var Audio : Node 
@onready var timer = $Timer

func _ready():
		timer.start()

func _on_timer_timeout():
	spawn()

func spawn():
		var randomNumber = randi_range(0,1)
		if randomNumber == 0:
			var enemy = basicEnemy.instantiate() as StaticBody2D
			enemyGroup.add_child(enemy)
			enemy.global_position = enemySpawner.global_position
			timer.start()
		elif randomNumber == 1:
			var bomb = bombEnemy.instantiate() as StaticBody2D
			enemyGroup.add_child(bomb)
			bomb.global_position = enemySpawner.global_position
			timer.start()
		else:
			pass


