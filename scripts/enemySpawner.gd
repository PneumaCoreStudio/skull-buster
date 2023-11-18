extends Node2D

@export var enemyType : PackedScene
@onready var enemySpawner = $"."
@export var enemyGroup : Node2D
@export var Audio : Node 

func _ready():
	spawn()


func _process(delta):
	if Input.is_action_just_pressed("spawn"):
		spawn()
	if Input.is_action_just_pressed("check"):
		print(Global.enemyCount)


func spawn():
		var enemy = enemyType.instantiate() as StaticBody2D
		enemyGroup.add_child(enemy)
		enemy.global_position = enemySpawner.global_position



