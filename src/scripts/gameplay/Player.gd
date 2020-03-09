#Script used by the player sprite
extends Sprite

#Set up detials for the player sprite
var speed = 512
var tile_size = 64

#Where sprite moved from
var last_position = Vector2()
#Where sprite wants to move to
var target_position = Vector2()
#Which directon the sprite is moving in
var move_dir = Vector2()

#RayCast will be use to check collision, named ray here to make calling it easier
onready var ray = $RayCast2D

func _ready():
	
	#Will snap the sprite to the gird when it moves
	position = position.snapped(Vector2(tile_size, tile_size))
	#Set last and target positions to current location
	last_position = position
	target_position = position


func _process(delta):
	
	#MOVING
	#if the ray is colliding with something
	if ray.is_colliding():
		#Places the sprite back where it came from.
		position = last_position
		target_position = last_position
		
	#If it isn't colliding
	else:
		#Position is equal to the speed of the sprite times the moving direction.
		#Delta prevents the sprite from lagging if the device is struggling.
		position += speed * move_dir * delta
		
		#If the sprite moves too far then will snap back to the target postion on the grid
		#speed * delta will move the sprite between frames so user wont notice if it does happen
		if position.distance_to(last_position) >= tile_size - speed * delta:
			position = target_position
	
	
	#STATIC
	#If sprite is at the target position 
	if position == target_position:
		#It will get the next movment direction
		_get_move_dir()
		last_position = position
		#Next posiotn is the move direction times the size of the sprite
		target_position += move_dir * tile_size


#Function will be used to get the direction the sprite shall move
func _get_move_dir():
	
	#Get direction from the key pressed
	var LEFT = Input.is_action_pressed("move_left")
	var RIGHT = Input.is_action_pressed("move_right")
	var DOWN = Input.is_action_pressed("move_down")
	var UP = Input.is_action_pressed("move_up")
	
	#Prevents the sprite from moving in two directions at once
	move_dir.x = -int(LEFT) + int(RIGHT)
	move_dir.y = -int(UP) + int(DOWN)
	
	#Prevents the sprite from moving diagonaly
	if move_dir.x != 0 && move_dir.y != 0:
		move_dir = Vector2.ZERO
	
	#Check to see if the sprite is moving
	if move_dir != Vector2.ZERO:
		#sets the ray cast to 1/2 the tile size
		ray.cast_to = move_dir * tile_size / 2

