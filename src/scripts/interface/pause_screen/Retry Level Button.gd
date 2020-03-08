extends Button

#Button will be used by a user to reset the current level they are playing.
func _on_Retry_Level_Button_button_up() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

