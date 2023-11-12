extends CharacterBody2D

@export var speed: float = 400.0
@export var gravity: float = 1000.0
@export var sprite_deform_scale: Vector2 = Vector2.ONE
@onready var animation_player = $AnimationPlayer

var canPick = true
var t:float = 0
const freq = 20
const SPEED = 200.0
const JUMP_VELOCITY = -300.0
const STOMP_VELOCITY = 600

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
			velocity.y += gravity * delta

	# Jump.
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		animation_player.play("jump")
	elif Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = 0

	# Stomp
	if Input.is_action_just_pressed("stomp") and not is_on_floor():
		velocity.y = STOMP_VELOCITY

	# Movement
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
#		rotation = sin(t*freq) * 0.3
#		t += delta
#		if not is_on_floor():
#			rotation = direction * 0.2
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
#		rotation = lerp_angle(rotation,0,0.4)
		
	move_and_slide()
