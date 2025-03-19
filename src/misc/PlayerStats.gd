extends Node
# Ce gdScript comptera les vies, score, etc-- Commentaire a mettre à jour

#signaler au reste du jeu ces events notamment l'interface
signal refresh_vie
signal mort_joueur

var vies: = 5 setget set_vies
var morts: = 0 setget set_morts

func restart_jeu():
	vies = 5
	morts = 0

func set_vies(new_value: int) -> void:
	vies = new_value
	emit_signal("refresh_vie")

func set_morts(new_morts: int) -> void:
	morts = new_morts
	emit_signal("mort_joueur")
