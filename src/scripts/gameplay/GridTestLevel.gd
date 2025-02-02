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

#event that is used to mimic button presses
var move_event = InputEventAction.new()
#set up for the press timer
var timer_press = Timer.new()


#Ready function
func _ready():
	
	#Set the popup variables with the correct nodes
	move_popup = $PopupLayer/MovePopup
	direction_popup = $PopupLayer/DirectionPopup
	chunk_command = $CodeCommandLayer/Command/ChunkSprites
	
	#Timer is so short due to being an isntant press
	timer_press.set_wait_time(0.00001)
	self.add_child(timer_press)
	

	#Adds items to the direction drop down box
	var direction_dropdown
	direction_dropdown = get_node("PopupLayer/DirectionPopup/Window/Content/UserEntry/Direction")
	_add_items_Direction(direction_dropdown)
	
	#For each button in the code chunks section
	for button in $CodeCommandLayer/CodeChunks/ChunkButtons.get_children():
		#when the button is pressed run function and get chunk_type
		button.connect("pressed", self, "_on_ChunkButton_pressed", [button.chunk_type])

#add items to the direction drop down box
func _add_items_Direction(direction_dropdown):
	direction_dropdown.add_item("Up")
	direction_dropdown.add_item("Down")
	direction_dropdown.add_item("Left")
	direction_dropdown.add_item("Right")

#function that will mimic an Input press in the code
func _mimic_Input_Press(key_to_mimic):
	
	#get the key to press
	move_event.action = key_to_mimic
	
	#start pressing the button
	move_event.pressed = true
	Input.parse_input_event(move_event)
	
	#wait before un pressing the button
	timer_press.start()
	yield(timer_press, "timeout")

	#stop pressing the button
	move_event.pressed = false
	Input.parse_input_event(move_event)

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
		print("error chunk button press")

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
		direction_string = "up"
	elif direction == 1:
		direction_string = "down"
	elif direction == 2:
		direction_string = "left"
	elif direction == 3:
		direction_string = "right"
	
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
	#Set direction to up incase user places move chunk first
	var current_direction = "up"
	var count = 0
	
	#For each chunk in the command
	for chunk in $CodeCommandLayer/Command/ChunkSprites.get_children():
		#get both the type and value of each of the chunks
		var current_chunk_type = chunk.chunk_type
		var current_chunk_value = chunk.chunk_value
		
		#Set up for the wait timer
		var timer_wait = Timer.new()
		#Set timer to a decnt time so the character will move steadily
		timer_wait.set_wait_time(0.5)
		self.add_child(timer_wait)
		
		#if the chunk is diretion
		if chunk.chunk_type == "direction":
			#Then change current direction to the value
			current_direction = chunk.chunk_value
			
			#count += 1
		#Else if the chunk type is move then	
		elif chunk.chunk_type == "move":
			#Set up the move with the current direction 
			var move_type = "move_" + current_direction
			#distance is the chunk_value if the chunk type is move
			var distance = chunk.chunk_value
			
			print(move_type, " for ", distance)
			
			if count == 0:
				distance += 1
			
			while distance > 0:
				
				print("moving")
				#Then run the Move Character function
				_mimic_Input_Press(move_type)
				
				#Second timer to wait until the character has moved before doing anything
				#Prevents the button being pressed multiple times without moving
				timer_wait.start()
				yield(timer_wait, "timeout")
				
				
				distance -= 1
				count += 1
		else:
			print("ERROR: Chunk type not recognised")
			count += 1

#Reset the command and level
func _on_Reset_Button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
