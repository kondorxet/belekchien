extends Button

export(String, FILE) var chemin_nextscene: = ""

func _on_RestartBouton_button_up() -> void:
	PlayerStats.vies -= 1
	if PlayerStats.vies < 0:
		get_tree().change_scene("gameover.tscn")
	else:
		get_tree().paused = false
		get_tree().reload_current_scene()
