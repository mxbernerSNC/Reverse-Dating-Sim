extends Node2D

var scene_text = {
	"phone.tscn": {
		"dialogue": [ 
			"you have just recieved a text message from your mother",
			"she has a date for you"
		],
		"question": "The date starts in an hour... What will you do?",
		"options": [
			{"text": "Take a long bath", "affection":5, "next": "drive.tscn"},
			{"text": "Take a one hour nap", "affection":1, "next": "drive.tscn"},
			{"text": "Roll around in mud", "affection":-5, "next": "drive.tscn"},
			{"text": "Rush out the door", "affection":1, "next": "drive.tscn"}
		]
	},

	"drive.tscn": {
		"dialogue": [ 
			"You are driving down the street"
		],
		"question": "You see a flower shop. Stop?",
		"options": [# todo: allow only two options
			{"text": "Get some flowers", "affection":0, "next": "distraction.tscn"},
			{"text": "Be on time", "affection":0, "next": "distraction.tscn"},
			{"text": "Get some flowers", "affection":0, "next": "distraction.tscn"},
			{"text": "Be on time", "affection":0, "next": "distraction.tscn"}
		]
	},

	"distraction.tscn": {
		"dialogue": [ 
			"You have arrived at the coffee shop",
			"Your date asks a personal question"
		],
		"question": "How can you get out of this situation?",
		"options": [
			{"text": "ignore her and change the subject", "affection":0, "next": "neutral.tscn"},
			{"text": "Pretend to fall off your chair", "affection":0, "next": "fire.tscn"},
			{"text": "Excuse yourself and go to the bathroom", "affection":0, "next": "fire.tscn"},
			{"text": "Accuse her of a crime", "affection":0, "next": "argument.tscn"}
		]
	},
	
	"fire.tscn": {
		"dialogue": [ ],
		"question": "Its getting hot in here, what do you do?",
		"options": [
			{"text": "Try to put out the fire", "affection":0, "next": "jail.tscn"},
			{"text": "Run away", "affection":0, "next": "good_end.tscn"},
			{"text": "Panic", "affection":0, "next": "jail.tscn"},
			{"text": "Blame your date", "affection":0, "next": "jail.tscn"}
		]
	},
	
	"neutral.tscn": {
		"dialogue": [ ],
		"question": "You managed to move on, but now she is asking for another date?",
		"options": [
			{"text": "Agree to a second date", "affection":0, "next": "bad_end.tscn"},
			{"text": "Run away", "affection":0, "next": "bad_end.tscn"},
			{"text": "Panic", "affection":0, "next": "good_end.tscn"},
			{"text": "Propose marrige", "affection":0, "next": "bad_end.tscn"}
		]
	},
	
	"argument.tscn": {
		"dialogue": [ ],
		"question": "The whole coffee shop is looking at you, what do you do?",
		"options": [
			{"text": "try to calm everyone down", "affection":0, "next": "good_end.tscn"},
			{"text": "run away", "affection":0, "next": "good_end.tscn"},
			{"text": "panic", "affection":0, "next": "good_end.tscn"},
			{"text": "blame your date", "affection":0, "next": "bad_end.tscn"}
		]
	}
}

var current_scene
var affection = 50
#if var == 0, adv to bad ending; if var ==100, adv to elope ending immediately
#else keep playing; once '20 questions' is over, score checked 25 < aff <75 correlates to bad < good < elope

var scene_tscn = {
	"phone.tscn": preload("res://phone.tscn"),
	"drive.tscn": preload("res://drive.tscn"),
	"distraction.tscn": preload("res://distraction.tscn"),
	"fire.tscn": preload("res://fire.tscn"),
	"jail.tscn": preload("res://jail.tscn"),
}

func _ready():
	$prompt.visible = false
	$title_screen/background/start.pressed.connect(_start_game)
	
func _start_game():
	$title_screen.visible = false
	$prompt.visible = true
	play_scene("phone.tscn")
	
func play_scene(scene_name):
	$prompt.visible = false
	print("Current affection: ", affection)
	
	# remove previous scene if there is one
	if current_scene: current_scene.queue_free()
	
	# instantiate scene file
	if scene_name in scene_tscn:
		current_scene = scene_tscn[scene_name].instantiate()
		self.add_child(current_scene)

	$dialogue.play(scene_text[scene_name])
	
func open_prompt(scene):
	$prompt.visible = true
	$prompt.ask_question(scene)

func change_affection(change_amount): set_affection(affection + change_amount)
func set_affection(amount): affection = amount

















