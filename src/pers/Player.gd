# OppsZone2 pour la fin du jeu (assommer un braconnier?)
# OppsZone pour regular gameplay


extends pers # default script qui handle les moves de base de "personnages"

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer") #implementer animation var

export var kill_impulsion: = 1000.0 #oppszone2 

func _on_OppsZone_body_entered(body):
	mourir()

func _on_OppsZone_area_entered(area):
	mourir()

func _on_OppsZone2_area_entered(area: Area2D) -> void:
	velocity = calculate_kill_velocity(velocity, kill_impulsion)
	
func _on_OppsZone2_body_entered(body):
	mourir()


func _physics_process(delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and velocity.y < 0.0
	
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite.play("courir")
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("move_left"):
		$AnimatedSprite.play("courir")
		$AnimatedSprite.flip_h = true
	if is_on_floor() == true:
		$AnimatedSprite.play("static")
	var direction: = get_direction()
	velocity = calculate_move_velocity(velocity, speed, direction, is_jump_interrupted)
	velocity = move_and_slide(velocity, FLOOR_NORMAL)
# ^ Permet d'interrompre un saut en lâchant action "jump".
	if Input.is_action_just_pressed("move_right") and is_on_floor():
		var audioPlayerNode = $"audioPlayer/AudioStreamPlayer2D"
		audioPlayerNode.play()
	if Input.is_action_just_pressed("move_left") and is_on_floor():
		var audioPlayerNode = $"audioPlayer/AudioStreamPlayer2D"
		audioPlayerNode.play()
	if Input.is_action_just_pressed("jump"):
		var audioPlayerNode = $"audioPlayer/SoundJump"
		audioPlayerNode.play()
	
	elif Input.is_action_just_released("move_right"):
		var audioPlayerNode = $"audioPlayer/AudioStreamPlayer2D"
		audioPlayerNode.stop()
	elif Input.is_action_just_released("move_left"):
		var audioPlayerNode = $"audioPlayer/AudioStreamPlayer2D"
		audioPlayerNode.stop()
	elif Input.is_action_just_released("jump"):
		var audioPlayerNode = $"audioPlayer/SoundJump"
		audioPlayerNode.stop()

func get_direction() -> Vector2: 
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 0.0
	)

func calculate_move_velocity(
		linear_velocity: Vector2,
		speed: Vector2,
		direction: Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
	var nvelle_velocity: = linear_velocity
	nvelle_velocity.x = speed.x * direction.x
	nvelle_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		nvelle_velocity.y = speed.y * direction.y
	if is_jump_interrupted:
			nvelle_velocity.y = 0.0
	return nvelle_velocity
	
func calculate_kill_velocity(linear_velocity: Vector2, impulsion: float) -> Vector2:
	var output: = linear_velocity
	output.y = -impulsion
	return output
#Only 4 OppsZone2. Rappel: import my older Player.scene from past backups  

func mourir() -> void:
	anim_player.play("Dying")
	PlayerStats.morts += 1

# code audio

	


