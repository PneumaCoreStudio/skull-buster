extends Node

var score : int
var time : float
var enemyCount

func _ready():
	score = 0
	time = 60

func _process(delta):
	if enemyCount == 0:
		print("Sucess")

#func success():
#	if enemyCount == 0:
#		print("SUCCESS")
