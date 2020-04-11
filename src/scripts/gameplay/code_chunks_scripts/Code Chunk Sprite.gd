extends Sprite

#Each chunk has a strign declaring what type it is (move etc)
export(String) var chunk_type

#Checks if the mouse is within the sprite
var mouse_in = false
#checks to see if the sprite is being dragged
var dragging = false


func _process(delta):
	#if mouse in and mouse button pressed
	if mouse_in && Input.is_action_pressed("mouse_left"):
		dragging = true
	
	#If draggin is true and mouse pressed
	if dragging && Input.is_action_pressed("mouse_left"):
		#position is the same as the mouses
		position = get_viewport().get_mouse_position()
	else:
		dragging = false
	

#When the mouse enters the sprite
func _on_Area2D_mouse_entered():
	mouse_in = true
	print("test")

##when the mouse leaves the sprite
func _on_Area2D_mouse_exited():
	mouse_in = false
