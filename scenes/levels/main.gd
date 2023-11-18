extends Node2D

var score : int
var time : float
var audio : Node
var enemyCount : int
@onready var enemyGroup = $enemyGroup

func _ready():
	Global.currentWorld = self
	audio = $audio
	Global.audioSystem = audio
	score = 0
	time = 60
func gameOver():
	get_node("player").animation.play("game over")
	get_node("skull").animation.play("game over")
	print("Game Over")
#	get_tree().paused = true

func _process(delta):
	if Global.gameOver == true:
		gameOver()

	enemyCount = enemyGroup.get_child_count()
	if Input.is_action_just_pressed("check"):
		print(enemyCount)
