extends Node

#Variable used to store the current chunks type
var current_chunk
var current_popup

#variable that will decide which chunk to add to the command
var chunk_to_show

#Create a variable for each of the popups
var move_popup
var direction_popup
var if_popup
var while_popup

#preload the chunk scenes
var move_chunk = load("res://src/interface/game_screen/command_buldier/code_chunks/Move Chunk .tscn")

func _ready():
	
	#Set the popup variables with the correct nodes
	move_popup = $PopupLayer/MovePopup
	direction_popup = $PopupLayer/DirectionPopup

	
	
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
	
	#if the current chunk is direction then	
	if current_chunk == "direction":
		#Sets the current popup to direction and shows it
		current_popup = direction_popup
		current_popup.visible = true
	
	#If the current chunk isn't recognised print Error
	else:
		print("error")

#Closes move popup
func _on_Move_Close_Button_pressed():
	move_popup.visible = false

#Closes and accepts data from move popup
func _on_Move_Enter_Button_pressed():
	#sets up distance variable
	var distance
	#gets the distance from the number etered by the user
	distance = $PopupLayer/MovePopup/Window/Content/UserEntry/Distance.value
	
	#Creates a new instace of the move chunk
	chunk_to_show = move_chunk.instance()
	#Sets the value for that chunk to the user entered distance
	chunk_to_show.chunk_value = distance
	

	#Create new sprite in the command block with the distance variable
	var chunk_command = $CodeChunkLayer/Command/ChunkSprites
	chunk_command.add_child(chunk_to_show)
	
	#Close the popup up when done
	move_popup.visible = false
