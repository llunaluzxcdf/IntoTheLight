extends Node2D

@export
var entrada_izq: Node2D
@export
var entrada_der: Node2D
@export
var entrada_abajo: Node2D
@export
var entrada_arriba: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match global.enter_scene:
		Types.Directions.left:
			print("left")
			if entrada_izq:
				$Personaje.global_position = entrada_izq.global_position
		Types.Directions.right:
			print("right")
			if entrada_der:
				$Personaje.global_position = entrada_der.global_position
		Types.Directions.up:
			if entrada_arriba:
				$Personaje.global_position = entrada_arriba.global_position
			print("up")
		Types.Directions.down:
			if entrada_abajo:
				$Personaje.global_position = entrada_abajo.global_position
			print("down")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
