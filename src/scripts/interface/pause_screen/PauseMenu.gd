extends Control

#When the quit game button is pressed the user will be taken to the title screen.
func _on_Quit_Game_Button_pressed():
	get_tree().change_scene("res://src/interface/title_screen/TitleScreen.tscn")

