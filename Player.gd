extends KinematicBody


var gravity = -9.8
var velocity = Vector3(0,0,0)
var camera

const SPEED = 0.1
const ACCELERATION = 3
const DEACCELERATION = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	"""
	camera = get_parent().get_node("Camera").get_global_transform()
	"""

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	var dir = Vector3()
	"""
	if (Input.is_action_pressed("move_fw")):
		dir += -camera.basis[2]
	if (Input.is_action_pressed("move_bwd")):
		dir += camera.basis[2]
	if (Input.is_action_pressed("move_l")):
		dir += -camera.basis[0]
	if (Input.is_action_pressed("move_r")):
		dir += camera.basis[0]
		
	dir.y = 0
	dir = dir.normalized()
	
	velocity.y += delta * gravity
	
	var hv = velocity
	hv.y = 0
	
	var newPos = dir * SPEED
	var accel = DEACCELERATION
	
	if (dir.dot(hv) > 0):
		accel = ACCELERATION
		
	hv = hv.linear_interpolate(newPos, accel * delta)
	
	velocity.x = hv.x
	velocity.z = hv.z
	
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))
	"""
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = lerp(velocity.x,0,0.1)
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		
	else:
		velocity.x = lerp(velocity.x,0,0.1)
	
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = lerp(velocity.z,0,0.1)
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
		
	else:
		velocity.z = lerp(velocity.z,0,0.1)
		
	velocity = move_and_slide(velocity)
	translate(velocity)
	print(velocity)
	
