extends Popup

export(String) var chunk_type



#When close button is pressed
func _on_Close_Button_pressed():
	var parent_node = get_tree().get_root().get_node("parent")
	#if the popup is visible 
	if get_node(parent_node).is_visible():
		#hide the popup
		get_node(parent_node).hide()
