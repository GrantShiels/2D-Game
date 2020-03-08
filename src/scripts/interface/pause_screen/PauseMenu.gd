#All script for the in game UI
extends Control












#-----------------------
#PAUSE MENU CODE
#-----------------------
#All code for the pause menu is within this chunk

#When the quit game button is pressed the user will be taken to the title screen.
func _on_Quit_Game_Button_pressed():
	get_tree().change_scene("res://src/interface/title_screen/TitleScreen.tscn")

#When user presses button the game will no longer be paused.
func _on_Resume_Game_Button_pressed():
	get_tree().paused = false


#-----------------------
#PAUSE MENU CODE
#-----------------------
