extends CharacterBody2D

const speed = 30
var current_state = IDLE

var dir = Vector2.RIGHT

@export var timelineName: String
@export var eli: DialogicTimeline


var is_roaming = true
var is_chatting = false

var player_in_area = false

enum {
	IDLE,
	NEW_DIR,
	MOVE
}

func _ready():
	randomize()
	Dialogic.signal_event.connect(DialogicSignal)

func _process(delta):
		if player_in_area:
			if Input.is_action_just_pressed("e") && !is_chatting:
				run_dialogue(timelineName)
				#get_tree().change_scene_to_packed(global.cuevas[7])
	
		if current_state == 0 or current_state == 1:
			$AnimatedSprite2D.play("idle")
		elif current_state == 2 and !is_chatting:
			if dir.x == -1:
				$AnimatedSprite2D.play("w-walk")
			if dir.x == 1:
				$AnimatedSprite2D.play("e-walk")
		if is_roaming:
			match current_state:
				IDLE:
					pass
				NEW_DIR:
					dir = choose([Vector2.RIGHT, Vector2.LEFT])
				MOVE:
					move(delta)
		#eli.DialogicSignal("fin").connect(get_tree().change_scene_to_packed(global.cuevas[7]))

func run_dialogue(dialogue_string):
	is_chatting = true
	is_roaming = false
	#var layout = 
	Dialogic.start(dialogue_string)
	Dialogic.timeline_ended.connect(timelineEnded)
	#layout.register_character(load("res://Dialogic/characters/Chuck.dch"), $".")
func timelineEnded():
	Dialogic.timeline_ended.disconnect(timelineEnded)
	is_chatting = false

func DialogicSignal(arg: String):
	if arg == "exit_chuck":
		$Timer.stop()
		$Timer.wait_time = 1000
		dir = Vector2.LEFT
		current_state = MOVE
		is_chatting = false
		is_roaming = true
		await get_tree().create_timer(30.0).timeout
		self.queue_free()

func choose(array):
	array.shuffle()
	return array.front()

func move(delta):
	if !is_chatting:
		position += dir * speed * delta


func _on_timer_timeout():
	$Timer.wait_time = choose([0.5, 1, 1.5])
	current_state = choose([IDLE, NEW_DIR, MOVE])


func _on_chat_detection_body_entered(body):
	if body.has_method("player"):
		print("asss")
		player_in_area = true

func _on_chat_detection_body_exited(body):
	if body.has_method("player"):
		print("ccc")
		player_in_area = false
