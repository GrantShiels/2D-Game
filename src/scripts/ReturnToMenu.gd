#This class is used by some buttons to return the user to the title screen.
extends Control

var scene_path_to_load

func _ready():
	for button in $Buttons/LineOne.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])

	for button in $Buttons/LineTwo.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
		
func _on_Button_pressed(scene_to_load):
	print("pressed")
	scene_path_to_load = scene_to_load
	
	if scene_path_to_load == "Exit":
		get_tree().quit()
	else:	
		$Transition.show()
		$Transition.fade_in()

func _on_Transition_fade_finished() -> void:
	get_tree().change_scene(scene_path_to_load)
	
#When user presses button return them to the title screen.
func _on_Back_Button_pressed() -> void:
	get_tree().change_scene("res://src/interface/title_screen/TitleScreen.tscn")
