extends StaticBody2D

var random_direction


func _process(delta):
	var nums = [-1,1]
	random_direction = (nums[randi() % nums.size()])
	global_position.y += 1


	var bodies = $Area2D.get_overlapping_bodies()
	for body in bodies:
		if body.name == "skull":
			Global.audioSystem.find_child("explode").play()
			Global.skull.apply_torque(100*100)
			Global.skull.apply_central_impulse(Vector2(random_direction * 350,-300))
			Global.skull.apply_torque(100*100)
			free()
