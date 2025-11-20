extends Node


var enter_scene: Types.Directions
@export var cuevas:Array[PackedScene]


var current_scene = "world" #world cliff side
var transtion_scene = false

var player_exit_cliffside_posx = 0
var player_exit_cliffside_posy = 0
var player_start_posx = 0
var player_start_posy = 0

func reiniciar_nivel():
	get_tree().change_scene_to_packed(cuevas[1])


	
