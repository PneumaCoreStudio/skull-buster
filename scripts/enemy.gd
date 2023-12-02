extends StaticBody2D

func _physics_process(delta):
	global_position.y += 3


	var bodies = $Area2D.get_overlapping_bodies()
	
	## Collides with Skull ##
	for body in bodies:
		if body.name == "skull":
			if get_node("../../skull").held == false:
				Global.score += 1
				print(Global.score)
				Global.audioSystem.find_child("explode").play()
				free()
			elif get_node("../../skull").held == true:
				Global.audioSystem.find_child("crunch").play()
				Global.gameOver = true
				free()
			else:
				Global.gameOver = true
		if body.name == "player":
			Global.audioSystem.find_child("crunch").play()
			Global.gameOver = true
			free()

## Collides with player##
		if body.name == "player":
			Global.gameOver = true
