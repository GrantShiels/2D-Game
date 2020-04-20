tool
extends Area2D
#Code for the goal entity that will move on to the next level

#Declare animation player on ready
onready var fade_animation: AnimationPlayer = $FadeAnimation

#var for the next level 
export var next_scene : PackedScene


#when somthing enters the goal
func _on_Goal2D_body_entered(body):
	
	print("entered goal")
	#Call the level complete function 
	_level_complete()


#Display warning if no next_scen 
func _get_configuration_warning() -> String:
	return "Next Scene is empty" if not next_scene else ""

#function will be called once the player has reached the goal and ready to move on
func _level_complete():
	#Start the fade animation for the next level
	fade_animation.play("fade_in")
	yield(fade_animation, "animation_finished")
	
	#Get the next scene
	get_tree().change_scene_to(next_scene)

