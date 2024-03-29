extends StaticBody2D

var random_direction

func _physics_process(delta):

	var nums = [-1,1]
	random_direction = (nums[randi() % nums.size()])
	global_position.y += 3


## Collision w/ Skull ##
	var bodies = $Area2D.get_overlapping_bodies()
	for body in bodies:
		if body.name == "skull":
			if get_node("../../skull").held == false:
				Global.score += 1
				print(Global.score)
				Global.audioSystem.find_child("explode").play()
				Global.skull.apply_torque(100*100)
				Global.skull.apply_central_impulse(Vector2(random_direction * 350,-300))
				Global.skull.apply_torque(100*100)
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

## Collision w/ Player ##
		if body.name == "player":
			Global.gameOver = true

