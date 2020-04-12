extends Sprite

#Each chunk has a strign declaring what type it is (move etc)
export(String) var chunk_type

#Checks if the mouse is within the sprite
var mouse_in = false
#checks to see if the sprite is being dragged
var dragging = false
#used to get the starting location of the chunk
var start_pos = Vector2()

func _ready():
	start_pos = get_position()

func _process(delta):
	#Get the starting position
	#start_pos = get_position()
	
	#if mouse in and mouse button pressed
	if mouse_in && Input.is_action_pressed("mouse_left"):
		dragging = true
	
	#If draggin is true and mouse pressed
	if dragging && Input.is_action_pressed("mouse_left"):
		#position is the same as the mouses
		position = get_viewport().get_mouse_position()
	else:
		dragging = false
	
	
	#If the sprite isn't being dragged then  return to start position
	if Input.is_action_just_released("mouse_left"):
		position = start_pos
	

#When the mouse enters the sprite
func _on_Area2D_mouse_entered():
	mouse_in = true

##when the mouse leaves the sprite
func _on_Area2D_mouse_exited():
	mouse_in = false
