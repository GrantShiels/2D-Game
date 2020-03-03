#This class is used by some buttons to return the user to the title screen.
extends Control

#When user presses button return them to the title screen.
func _on_Back_Button_pressed() -> void:
	get_tree().change_scene("res://src/interface/title_screen/TitleScreen.tscn")
