extends Node2D

@export var tumba: Area2D

func _ready():
	tumba.body_entered.connect(_on_area_2d_body_entered)


func _on_area_2d_body_entered(_body: Node2D) -> void:
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://escenas/niveles/cueva/cueva.tscn")
