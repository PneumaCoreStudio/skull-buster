extends CharacterBody2D

@export var speed: float = 400.0
@export var gravity: float = 1000.0
@export var sprite_deform_scale: Vector2 = Vector2.ONE
@onready var animation = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var marker = $Marker2D

var canPick = true
var t:float = 0
const freq = 20
const SPEED = 200.0
const JUMP_VELOCITY = -300.0
const STOMP_VELOCITY = 600

func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _physics_process(delta):

	## Add the gravity ##
	if not is_on_floor():
			velocity.y += gravity * delta



	## Jump ##
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation.play("jump")
	elif Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = 0


	var direction = Input.get_axis("left", "right")
	if Input.is_action_pressed("left"):
		sprite.scale.x = -1
	elif Input.is_action_pressed("right"):
		sprite.scale.x = 1
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		rotation = lerp_angle(rotation,0,0.4)

	if Global.gameOver == true:
		return
	move_and_slide()
