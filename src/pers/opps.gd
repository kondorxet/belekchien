extends "res://src/pers/pers.gd"


func _ready() -> void:
	set_physics_process(false)
	get_node("opps").visible = true
	velocity.x =  -speed.x
	
func _on_KillZone_body_entered(body: PhysicsBody2D) -> void:
	if body.global_position.y > get_node("KillZone").global_position.y:
		queue_free()
		return
	get_node("CollisionShape2D").disabled = true
	var audioPlayerNode = $"audioPlayer/AudioStreamPlayer"
	audioPlayerNode.play()
	get_node("opps").visible = true


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	if is_on_wall():
		velocity.x *= -1.0
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y
	
