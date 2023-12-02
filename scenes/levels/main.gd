extends Node2D

var score : int
var time : float
var audio : Node
var enemyCount : int
@onready var enemyGroup = $enemyGroup
@onready var animation = $AnimationPlayer
@onready var label = $"Game Over/Label"
@onready var path_2d = $Path2D
@onready var path_follow_2d = $Path2D/PathFollow2D
@onready var enemy_spawner = $enemySpawner

func _ready():
	Global.currentWorld = self
	audio = $audio
	Global.audioSystem = audio
	score = 0
	time = 60
	label.visible = false

func gameOver():
	label.visible = true
	get_node("player").animation.play("game over")
	get_node("skull").animation.play("game over")
#	Engine.time_scale = 0.2
	await get_tree().create_timer(1).timeout
	animation.play("Game Over")
	await get_tree().create_timer(1).timeout
	get_tree().paused = true

func _process(delta):
	if Global.gameOver == true:
		gameOver()
		return

	enemyCount = enemyGroup.get_child_count()
	if Input.is_action_just_pressed("check"):
		print(enemyCount)

	var random_offset = randf_range(0,1)
	path_follow_2d.progress_ratio = random_offset
