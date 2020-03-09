#All script for the in game UI
extends Control

#When the scene first loads get the current scene tree and get the pause menu
onready var scene_tree: = get_tree()
onready var pause_overlay: ColorRect = get_node("Pause Overlay")

var paused: = false setget set_paused

#If user presses pause key (Esc) then invert the pause value.
func _unhandled_input(event: InputEvent) -> void: 
	if event.is_action_pressed("pause"):
		self.paused = not paused
		scene_tree.set_input_as_handled()
	

func set_paused(value:bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
	







#When the quit game button is pressed the user will be taken to the title screen.
func _on_Quit_Game_Button_pressed():
	get_tree().change_scene("res://src/interface/title_screen/TitleScreen.tscn")
	self.paused = not paused

#When user presses button the game will no longer be paused.
func _on_Resume_Game_Button_pressed():
	get_tree().paused = false
