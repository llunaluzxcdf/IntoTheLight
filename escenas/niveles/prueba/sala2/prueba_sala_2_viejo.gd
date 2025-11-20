extends Node2D

@export var puerta1: Area2D
@export var personaje: CharacterBody2D
@export var sala1: Node

signal puerta_sala_1_2

func _ready():
	sala1.puerta_sala_1_2.connect(_posicion_sala1)
	puerta1.area_2d.body_entered.connect(_on_area_2d_body_entered)


func _on_area_2d_body_entered(_body: Node2D) -> void:
	sala1.puerta_sala_1_2.emit()
	await get_tree().create_timer(0.25).timeout
	get_tree().change_scene_to_file("res://escenas/niveles/cueva/sala1/cueva_sala_1.tscn")
	
func _posicion_sala1():
	personaje.position = puerta1.position
