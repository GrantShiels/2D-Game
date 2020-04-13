extends Node


func _ready():
	for button in $CodeChunkLayer/CodeChunks/ChunkButtons.get_children():
		button.connect("pressed", self, "_on_ChunkButton_pressed", [button.chunk_type])



func _on_ChunkButton_pressed(chunk_type):
	print(chunk_type)

