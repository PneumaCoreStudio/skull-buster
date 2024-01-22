extends StaticBody2D

func _physics_process(delta):

#region Enemy Movement
	global_position.y += 3
#endregion

#region Collision w/ Skull
	var bodies = $Area2D.get_overlapping_bodies()
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

		if body.name == "player":
			Global.gameOver = true

