extends StaticBody2D
var random_direction
var clamped_velocity = Vector2(100,100)


func _process(delta):
	var nums = [-1,1]
	random_direction = (nums[randi() % nums.size()])

func _on_area_2d_area_entered(area):
	Global.score += 1
	print(Global.score)
	get_node("../../audio/explode").play()
	get_node("../../skull").apply_torque(100*100)
	get_node("../../skull").apply_central_impulse(Vector2(random_direction * 350,-300))
	get_node("../../skull").apply_torque(100*100)
	queue_free()
