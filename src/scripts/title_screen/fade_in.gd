#This script is used to trigger the fade animation when the user presses menu buttons
extends ColorRect

#creates a sigbnal that will be returned once the fade has finished
signal fade_finished

#This will play the fade to black animation
func fade_in():
	$AnimationPlayer.play("transition_fade")


#Once the animation has finsihed it shall emit a signal
func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("fade_finished")


