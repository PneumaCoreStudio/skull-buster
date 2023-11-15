extends StaticBody2D
var random_direction
var clamped_velocity = Vector2(100,100)


func _process(delta):
	var nums = [-1,1]
	random_direction = (nums[randi() % nums.size()])


	var bodies = $Area2D.get_overlapping_bodies()
	for body in bodies:
		if body.name == "skull":
			get_node("../../audio/explode").play()
			get_node("../../skull").apply_torque(100*100)
			get_node("../../skull").apply_central_impulse(Vector2(random_direction * 350,-300))
			get_node("../../skull").apply_torque(100*100)
			queue_free()


## Old enemy kill code ##
#func _on_area_2d_area_entered(area):
#	Global.score += 1
#	Global.enemyCount -= 1
#	get_node("../../audio/explode").play()
#	get_node("../../skull").apply_torque(100*100)
#	get_node("../../skull").apply_central_impulse(Vector2(random_direction * 350,-300))
#	get_node("../../skull").apply_torque(100*100)
#	queue_free()
