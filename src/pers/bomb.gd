extends "res://src/pers/pers.gd"

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")


func _ready() -> void:
	set_physics_process(false)
	velocity.x = -speed.x
	
func _on_KillZone_body_entered(body: CollisionShape2D, Area2D) -> void:
	# if body.global_position.y > get_node("KillZone").global_position.y:
		# return
	get_node("CollisionShape2D").disabled = true
	# PlayerStats.vies -= vies
	var audioPlayerNode = $"explosionSound/AudioStreamPlayer"
	audioPlayerNode.play()
	anim_player.play("Explosion")
	


func _on_KillZone_area_entered(area):
	get_node("CollisionShape2D").disabled = true
	var audioPlayerNode = $"explosionSound/AudioStreamPlayer"
	audioPlayerNode.play()
	anim_player.play("Explosion")
