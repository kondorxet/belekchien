extends Button

export(String, FILE) var chemin_nextscene: = "" # dit a godot que la var est un fichier. Permet de ne pas hardcode un chemin de scène

func _on_LancerJeuBouton_button_up(): # button_up psk sinon jeu start avant mm q le joueur ait lâché le bouton
	PlayerStats.restart_jeu()
	get_tree().change_scene(chemin_nextscene)
