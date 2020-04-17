#Base script for all code chunks
extends NinePatchRect

#Export a string for the current chunk type
export(String) var chunk_type
#Export a string for the current chunk value
export(String) var chunk_value

func _ready():
	$Info/Value.text = str(chunk_value)
	
