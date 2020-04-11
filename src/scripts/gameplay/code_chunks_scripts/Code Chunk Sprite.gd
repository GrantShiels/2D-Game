extends Sprite

#Each chunk has a strign declaring what type it is (move etc)
export(String) var chunk_type

#Checks if the mouse is within the sprite
var mouse_in = false
#checks to see if the sprite is being dragged
var dragging = false

#func _input(event):
#	#If left mouse button is pressed then
#	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
#		#If the mouse is within the sprite
#		if mouse_in == true:
#			#If the button is pressed and draggin is false
#			if event.pressed and !dragging:
#				dragging = true
#
#		#If the button is being pressed and button is let go
#		if !event.pressed and dragging:
#			dragging = false
#
#	if event is InputEventMouseMotion and dragging:
#		#While dragging is true and button pressed move the area with the mouse
#		$Area2D.position = event.position


func _process(delta):
	#if mouse in and mouse button pressed
	if mouse_in == true && 
	


#When the mouse enters the sprite
func _on_Area2D_mouse_entered():
	mouse_in = true

#when the mouse leaves the sprite
func _on_Area2D_mouse_exited():
	mouse_in = false
