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

#var to show the code chunks
var chunk_command

#preload the chunk scenes
var move_chunk = load("res://src/interface/game_screen/command_buldier/code_chunks/Move Chunk .tscn")
var direction_chunk = load("res://src/interface/game_screen/command_buldier/code_chunks/Direction Chunk.tscn")

#Array that will hold the data and type of the users command
var user_command = []

#Ready function
func _ready():
	
	#Set the popup variables with the correct nodes
	move_popup = $PopupLayer/MovePopup
	direction_popup = $PopupLayer/DirectionPopup
	chunk_command = $CodeChunkLayer/Command/ChunkSprites

	#Adds items to the direction drop down box
	var direction_dropdown
	direction_dropdown = get_node("PopupLayer/DirectionPopup/Window/Content/UserEntry/Direction")
	_add_items_Direction(direction_dropdown)
	
	#For each button in the code chunks section
	for button in $CodeChunkLayer/CodeChunks/ChunkButtons.get_children():
		#when the button is pressed run function and get chunk_type
		button.connect("pressed", self, "_on_ChunkButton_pressed", [button.chunk_type])

#add items to the direction drop down box
func _add_items_Direction(direction_dropdown):
	direction_dropdown.add_item("Up")
	direction_dropdown.add_item("Down")
	direction_dropdown.add_item("Left")
	direction_dropdown.add_item("Right")

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
	elif current_chunk == "direction":
		#Sets the current popup to direction and shows it
		current_popup = direction_popup
		current_popup.visible = true
	#If the current chunk isn't recognised print Error
	else:
		print("error1")

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
	chunk_command.add_child(chunk_to_show)
	
	#Close the popup up when done
	move_popup.visible = false

#Closes the direction popup
func _on_Direction_Close_Button_pressed():
	direction_popup.visible = false

#Closes and acepts data from the direction popup
func _on_Direction_Enter_Button_pressed():
	#Sets up the direction variable
	var direction
	var direction_string
	#Gets the direction from the drop down box in the popup.
	direction = $PopupLayer/DirectionPopup/Window/Content/UserEntry/Direction.selected
	
	#Convert the direction int to string
	if direction == 0:
		direction_string = "Up"
	elif direction == 1:
		direction_string = "Down"
	elif direction == 2:
		direction_string = "Left"
	elif direction == 3:
		direction_string = "Right"
	
	#Creates a new instance of the direction chunk
	chunk_to_show = direction_chunk.instance()
	#Sets the calue of the chunk to the user entered variable
	chunk_to_show.chunk_value = direction_string
	
	#Creates a new chunk in the command block with the direction variable
	chunk_command.add_child(chunk_to_show)
	
	#Close the direction popup when done
	direction_popup.visible = false

#Button that will run the users finished command
func _on_Run_Command_pressed():
	#Resets the user_command array to blank
	user_command = []
	
	#For each chunk in the command
	for chunk in $CodeChunkLayer/Command/ChunkSprites.get_children():
		#get both the type and value of each of the chunks
		var current_chunk_type = chunk.chunk_type
		var current_chunk_value = chunk.chunk_value
		
		#Create an array that holds both type and value
		var chunk_array = [current_chunk_type, current_chunk_value]
		
		#insert the chunk as type and value into the command array
		user_command.append(chunk_array)
	
	#Test print
	print(user_command)
	
	_move_Player(user_command)


#Function used to move the character		
func _move_Player(user_command):
	#set the current direction the player should be moving, will be used if a move
	#chunk is placed without a direction chunk
	var current_direction = "up"
	
	#For each entry in the user_command array
	for chunk_string in user_command:
		#get both the type and strign value
		var chunk_string_type = chunk_string[0]
		var chunk_string_value = chunk_string[1]
		
		#if the current type is direction then
		if chunk_string_type == "direction":
			#set the current direction
			current_direction = chunk_string_value
			
		#Else if the current type is move then
		elif chunk_string_type == "move":
			#set the button that's to be pressed
			var input_key = "move_" + current_direction
			#set the amount of time that button will be pressed
			var distance = chunk_string_value
			
			#run the mimic command
			_mimic_Input_Press(input_key, distance)

		else:
			print("ERROR")
			
			

#function that will mimic an Input press in the code
func _mimic_Input_Press(key_to_mimic, press_count):
	var event = InputEventAction.new()
	event.action = key_to_mimic
	
	#set up for the timer
	
	#while distance isn't 0
	while press_count != 0:
		#take away 1 from the cunt each time
		press_count = press_count - 1
		
		#mimic the pressing of a key
		event.pressed = true
		Input.parse_input_event(event)
		
		#wait half a second before doing again
		
	
