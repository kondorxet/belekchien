tool
extends Area2D


onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

func _on_body_entered(body: PhysicsBody2D) -> void:
	teleportation()


export var next_scene: PackedScene

func _get_configuration_warning() -> String:
	return "Aucun niveau associé au portail." if not next_scene else ""

func teleportation() -> void:
	anim_player.play("Fondu_On")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)


