#Script used by exit button to close game
extends Button

#Will quit the game
func _on_Exit_Game_Button_button_up():
	get_tree().quit()
