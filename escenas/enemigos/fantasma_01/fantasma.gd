extends CharacterBody2D

class_name  Fantasma


@export var character: CharacterBody2D
@export var area_2d: Area2D
@export var sprite: AnimatedSprite2D

var golpes: int = 0

const SPEED = 75.0

func _physics_process(_delta: float) -> void:
	if golpes >= 3:
		queue_free()
		return
	look_at(character.position)
	var dir: Vector2 = Vector2.from_angle(rotation)
	velocity = dir * SPEED

	move_and_slide()	
	
func hit():
	golpes += 1
	sprite.modulate = Color(18.892, 0.0, 0.0, 1.0)
	await get_tree().create_timer(0.1).timeout
	sprite.modulate = Color(1.0, 1.0, 1.0, 1.0)
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.get_hit_fantasma()
