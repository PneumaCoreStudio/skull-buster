extends RigidBody2D

const THROW_FORCE = Vector2(0,-900)
var dropLerp = .7
var held : bool
var inAir : bool
@onready var sprite = $Sprite2D
@onready var animation = $AnimationPlayer

func _ready():
	Global.skull = self
	z_index = -1
	held = false
	if held != true:
		inAir = false
	inAir = true

func _physics_process(delta):
	if held:
		sleeping = true
		if Input.is_action_pressed("left"):
			sprite.scale.x = -1
		elif Input.is_action_pressed("right"):
			sprite.scale.x = 1


	if held == true:
		global_position = lerp(global_position, get_node("../player/Marker2D").global_position, dropLerp)
		rotation = 0
		z_index = 2
		lerp_angle(rotation,0,0.4)
		if Input.is_action_just_pressed("throw"):
			throw()

	if inAir == true:
		var bodies = $Area2D.get_overlapping_bodies()
		for body in bodies:
			if body.name == "player" and inAir == true:
				inAir = false
				held = true
				get_node("../player").canPick = false


## THROW FUNCTIONALITY ##
func throw():
	held = false
	sleeping = false
	get_node("../player/AnimationPlayer").play("throw")
	get_node("../audio/throw").play()
	get_node("../player").canPick = true
	apply_central_impulse(THROW_FORCE)
	apply_torque(91*100)
	await get_tree().create_timer(.5).timeout
	inAir = true


### PICKING & DROPPING FUNCTIONALITY ##
#func _input(event):
#	if Input.is_action_just_pressed("pick"):
#		var bodies = $Area2D.get_overlapping_bodies()
#		for body in bodies:
#			if body.name == "player" and get_node("../player").canPick == true:
#				held = true
#				get_node("../player").canPick = false
#			elif body.name == "player" and get_node("../player").canPick == false:
#				held = false
#				get_node("../player").canPick = true
