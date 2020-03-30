extends Area2D

export(String) var chunk_type

var distance

#Function allows the user to click on the code chunk.
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

#when the user clicks it will run the code
func on_click():
	print(chunk_type)
	print("click")
	
	#If the user selects a move chunk it will also need to know the distance
	if "move" in chunk_type:
		#ask for the distance
		#then add the chunk to the comand
		print("test")
