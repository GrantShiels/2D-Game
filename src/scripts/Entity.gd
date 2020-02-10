#Default Class for all game entities
extends KinematicBody2D
class_name Entity

#Controls the speed at which the entity moves
export var speed: = Vector2(500.0, 1500.0)
export var gravity: = 4000.0

var velocity: = Vector2.ZERO

