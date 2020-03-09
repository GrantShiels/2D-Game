#Script used by the player sprite
extends Sprite

#Set up detials for the player sprite
var speed = 256
var tile_size = 64

#Where sprite moved from
var target_position = Vector2()
#Where sprite is moving to
var last_position = Vector2()
#Which directon the sprite is moving in
var move_dir = Vector2()


