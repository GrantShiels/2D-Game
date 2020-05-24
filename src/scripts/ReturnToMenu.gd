#This class is used by some buttons to return the user to the title screen.
#Majority of this code has been inherited or copied from the Main Menu script file
extends Control

#get the scene that should be loaded when the button is pressed
var scene_path_to_load

func _ready():
	#Get's all the button in the first column
	for button in $Buttons/LineOne.get_children():
		#connect the button press to the button press function	
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])

	#Works the same as the previous for statment but runs through the second column
	for button in $Buttons/LineTwo.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
	
#When a button is pressed	
func _on_Button_pressed(scene_to_load):
	print("pressed")
	#get the scene file path
	scene_path_to_load = scene_to_load
	
	#if it's exit
	if scene_path_to_load == "Exit":
		get_tree().quit()
	else:	
		$Transition.show()
		$Transition.fade_in()

#When  the transition is finished load the new scene
func _on_Transition_fade_finished() -> void:
	get_tree().change_scene(scene_path_to_load)
	
#When user presses button return them to the title screen.
func _on_Back_Button_pressed() -> void:
	get_tree().change_scene("res://src/interface/title_screen/TitleScreen.tscn")


