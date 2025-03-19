extends Control

# scene_tree get_tree()

onready var MenuPause: = get_node("MenuPause")
var pause: = false setget set_pause
onready var vies: Label = get_node("Label")
onready var pause_titre: Label = get_node("MenuPause/Label")

func _unhandled_input(event:InputEvent) -> void: # enregistre esc comme trigger de MenuPause
	if event.is_action_pressed("pause"):
		self.pause = !pause #Si c'est vrai, rends le faux, si c'est faux rend le vrai. 
		get_tree().set_input_as_handled()
	
func set_pause (value: bool) -> void:
	pause = value
	get_tree().paused = value
	MenuPause.visible = value

func _ready() -> void:
	PlayerStats.connect("refresh_vie", self, "refresh_interface")
	PlayerStats.connect("mort_joueur", self, "_on_PlayerStats_mort_joueur")
	refresh_interface()

func _on_PlayerStats_mort_joueur() -> void:
	yield(get_tree().create_timer(0.93), "timeout")
	self.pause = true
	pause_titre.text = "Vous êtes mort"

func refresh_interface() -> void:
	vies.text = "%s" % PlayerStats.vies
	
