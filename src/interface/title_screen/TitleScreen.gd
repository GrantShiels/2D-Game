extends Control

var scene_path_to_load

func _ready():
	for button in $Menu/CentreRow/Buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
		
func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	
	if scene_path_to_load == "Exit":
		get_tree().quit()
	else:	
		$Transition.show()
		$Transition.fade_in()

func _on_Transition_fade_finished() -> void:
	get_tree().change_scene(scene_path_to_load)
