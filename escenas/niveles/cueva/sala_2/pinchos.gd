extends Node2D

@export var pinchos: TileMapLayer

var Switch: bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loopTween()

func loopTween():
	var tween = create_tween()
	tween.tween_interval(1.5)
	tween.tween_callback(func():
		Switch = false
		)
	tween.tween_interval(1.5)
	tween.tween_callback(func():
		Switch = true
		loopTween()
		)	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:

	if Switch:
		pinchos.visibility_layer = true
		pinchos.collision_enabled = true
	else:
		pinchos.visibility_layer = false
		pinchos.collision_enabled= false
