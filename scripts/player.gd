extends CharacterBody2D


const MAX_SPEED = 400.0
const ACCELERATION = 2.0
const RESISTANCE = 2.0
const BREAK_BONUS = 1.0

var momentum = Vector2(0, 0)

signal player_collisions_with_hazard

func are_oposite_numbers(n1: float, n2: float):
	if (n1 > 0 and n2 < 0):
		return true
	if (n1 < 0 and n2 > 0):
		return true
	return false

func are_oposite_vectors(v1: Vector2, v2: Vector2):
	if abs(v1.angle_to(v2)) > PI / 2 * 1.5:
		return true
	else:
		return false

func _physics_process(delta):

	var direction = Input.get_vector("left", "right", "up", "down")
	
	var break_bonus = 1
	if (are_oposite_vectors(direction, momentum)):
		break_bonus = BREAK_BONUS
		print("BREAAAAAAAAK")
	
	momentum += direction * delta * ACCELERATION * break_bonus
	
	if momentum.length() > 1.0:
		momentum = momentum.normalized()
	if direction.length() == 0:
		momentum -= momentum * RESISTANCE * delta

	velocity = momentum * 400
	move_and_slide()
