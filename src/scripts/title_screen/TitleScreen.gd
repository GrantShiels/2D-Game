extends Control

#Variable used to detemrine which scene shall be loaded
var scene_path_to_load

func _ready():
	#For each of the buttons present
	for button in $Menu/CentreRow/Buttons.get_children():
		#connect the button press to the button press function
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
		
#button press function that will load the next scene
func _on_Button_pressed(scene_to_load):
	print("pressed")
	scene_path_to_load = scene_to_load
	
	#if the scene is exit then the game will close
	if scene_path_to_load == "Exit":
		get_tree().quit()
	else:	
		#if it's not quit then it shall begin the fade transition 
		$Transition.show()
		$Transition.fade_in()

#will detect when the transition fade has finsihed
func _on_Transition_fade_finished() -> void:
	#once it's finsihed the game will chnage scene
	get_tree().change_scene(scene_path_to_load)



