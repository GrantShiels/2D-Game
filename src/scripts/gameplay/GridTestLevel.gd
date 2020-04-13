extends Node

#Variable used to store the current chunks type
var current_chunk
var current_popup
var current_enter
var current_close

#Create a variable for each of the popups
var move_popup
var if_popup
var while_popup


func _ready():
	
	#Set the popup variables
	move_popup = $PopupLayer/MovePopup
	
	
	#For each button in the code chunks section
	for button in $CodeChunkLayer/CodeChunks/ChunkButtons.get_children():
		#when the button is pressed run function and get chunk_type
		button.connect("pressed", self, "_on_ChunkButton_pressed", [button.chunk_type])


#Code runs when chunk button is bressed
func _on_ChunkButton_pressed(chunk_type):
	#set current chunk to the chunk_type of the button pressed
	current_chunk = chunk_type
	
	#If the current_chunk is move then.
	if current_chunk == "move":
		
		#Sets the current popup to move and shows it
		current_popup = move_popup
		current_popup.visible = true

	else:
		print("error")

#Closes move popup
func _on_Move_Close_Button_pressed():
	move_popup.visible = false

#Closes and accepts data from move popup
func _on_Move_Enter_Button_pressed():
	#sets up distance variable
	var distance
	distance = $PopupLayer/MovePopup/Window/Content/UserEntry/Distance.value
	print(distance)
	
	#Create new sprite in the command block with the distance variable
	
	
	#Close the up up when done
	move_popup.visible = false
