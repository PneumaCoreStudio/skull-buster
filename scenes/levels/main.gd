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
	print(Global.audioSystem)
	score = 0
	time = 60

func _process(delta):
	enemyCount = enemyGroup.get_child_count()
	print(enemyCount)
