extends Area2D

export var vies: = 1

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")


func _on_body_entered(body: PhysicsBody2D) -> void:
	PlayerStats.vies += vies
	var audioPlayerNode = $"PickupSound/AudioStreamPlayer"
	audioPlayerNode.play()
	anim_player.play("fondu_off") # anim de pickup

