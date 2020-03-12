extends Sprite

#Code for each code chunk
#Will export the string of the code chunks name.
export (String) var chunk_type

#The code below controls the drag and drop functionality of the code chunks.
var mouse_in = false
var dragging = false

func _process(delta):
	if mouse_in && Input.is_action_pressed("left_click"):
		dragging = true
		
	if dragging && Input.is_action_pressed("left_click"):
		position = get_viewport().get_mouse_position()
		
	else:
		dragging = false

#Theses two functions are used to detect if the users mouse is over the code chunk.
#It will set the sprite to be draggable if the mouse is in and not if it isn't
func _on_Area2D_mouse_entered():
	mouse_in = true
	print("Mouse in")

func _on_Area2D_mouse_exited():
	mouse_in = false
	print("Mouse in")
