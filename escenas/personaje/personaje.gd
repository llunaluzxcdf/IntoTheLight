extends CharacterBody2D

class_name Player

@export var animacion: AnimatedSprite2D
@export var area_2d: Area2D
@export var area_pinchos: Area2D
@export var lucero: Area2D
@export var sprite: AnimatedSprite2D

var _velocidad: float = 100.0
var golpes_personaje: int = 0

signal personaje_muerto

func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	if golpes_personaje >= 3:
		animacion.play("muerta")
		await get_tree().create_timer(1.5).timeout
		global.reiniciar_nivel()
		return
	
	if Input.is_action_pressed("derecha"):
		velocity.x = _velocidad
		animacion.play("derecha")
		animacion.flip_h = false
	elif Input.is_action_pressed("izquierda"):
		velocity.x = -_velocidad
		animacion.play("izquierda")
		animacion.flip_h = true
	elif Input.is_action_pressed("arriba"):
		velocity.y = -_velocidad
		animacion.play("arriba")
	elif Input.is_action_pressed("abajo"):
		velocity.y = _velocidad
		animacion.play("abajo")
	else:
		animacion.play("idle")
		velocity.x = 0
		velocity.y = 0
	move_and_slide()
	
	if Input.is_action_pressed("luz"):
		lucero.visibility_layer = true
		lucero.monitoring = true
		lucero.look_at(get_global_mouse_position())
	else:
		lucero.visibility_layer = false
		lucero.monitoring = false
		
	if Input.is_action_just_pressed("palazo"):
		print("ponk")
		
		
		
func get_hit_fantasma():
	golpes_personaje += 1
	sprite.self_modulate = Color(18.892, 0.0, 0.0, 1.0)
	await get_tree().create_timer(0.1).timeout
	sprite.self_modulate = Color(1.0, 1.0, 1.0, 1.0)



func _on_pinchos_body_entered(_body: Node2D) -> void:
	print("aaaaaaa")
	golpes_personaje += 1
	sprite.self_modulate = Color(18.892, 0.0, 0.0, 1.0)
	await get_tree().create_timer(0.1).timeout
	sprite.self_modulate = Color(1.0, 1.0, 1.0, 1.0)

func player():
	pass
