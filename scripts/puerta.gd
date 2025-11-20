extends Area2D

@export var dire: Types.Directions
@export var nextScene: int
var enable: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
	var tween = create_tween()
	tween.tween_interval(0.1)
	tween.tween_callback(func():
		enable = true
		)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is Player && enable: 
		global.enter_scene = dire
		get_tree().change_scene_to_packed(global.cuevas[nextScene])


func _on_body_exited(_body: Node2D) -> void:
	pass # Replace with function body.
