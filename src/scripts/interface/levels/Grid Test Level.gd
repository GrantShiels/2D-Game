extends Node

#Get the highlight colorRect
onready var highlight: ColorRect = get_node("Code Chunk Layer/Destination/Destination Highlight") 

#When mouse enters Destination
func _on_Destination_mouse_entered():
	highlight.visible = true
	print("test")

#When mouse leaves destination
func _on_Destination_mouse_exited():
	highlight.visible = false
