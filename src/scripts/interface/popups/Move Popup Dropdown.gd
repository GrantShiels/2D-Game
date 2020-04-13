extends VBoxContainer

export (NodePath) var direction_dropdown_path
onready var direction_dropdown = get_node("Direction")

func _ready():
	#Adds items to the direction drop down box
	_add_items_Direction()


func _add_items_Direction():
	direction_dropdown.add_item("Up")
	direction_dropdown.add_item("Down")
	direction_dropdown.add_item("Left")
	direction_dropdown.add_item("Right")
