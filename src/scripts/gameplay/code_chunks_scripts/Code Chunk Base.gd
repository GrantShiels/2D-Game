extends Area2D

#Function allows the user to click on the code chunk.
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

#when the user clicks it will run the code
func on_click():
	print("Click")
