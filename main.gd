extends Node2D

var affection = 50
#if var == 0, adv to bad ending; if var ==100, adv to elope ending immediately
#else keep playing; once '20 questions' is over, score checked 25 < aff <75 correlates to bad < good < elope

var scene_text = {
	#"prologue.tscn" : {
	#	"dialogue" : "Mom: 
	#},
	#I don't think i'm doing this right so maybe someone else can get this part started

	"phone.tscn": {
		"question": "The date starts in an hour... What will you do?",
		"options": [
			{"text": "Take a long bath", "next": "distraction.tscn"},
			{"text": "Take a one hour nap", "next": "distraction.tscn"},
			{"text": "Roll around in mud", "next": "distraction.tscn"},
			{"text": "Rush out the door", "next": "distraction.tscn"}
		]
	},


	"drive.tscn": {
	"question": "You see a flower shop. Stop?",
		"options": [
			{"text": "Get some flowers", "next": "distraction.tscn"},
			{"text": "Be on time", "next": "distraction.tscn"}
		]
	},

	"distraction.tscn": {
		"question": "How can you get out of this situation?",
		"options": [
			{"text": "ignore her and change the subject", "next": "neutral.tscn"},
			{"text": "Pretend to fall off your chair", "next": "fire.tscn"},
			{"text": "Excuse yourself and go to the bathroom", "next": "fire.tscn"},
			{"text": "Accuse her of a crime", "next": "argument.tscn"}
		]
	},
	"fire.tscn": {
		"question": "Its getting hot in here, what do you do?",
		"options": [
			{"text": "Try to put out the fire", "next": "jail.tscn"},
			{"text": "Run away", "next": "good_end.tscn"},
			{"text": "Panic", "next": "jail.tscn"},
			{"text": "Blame your date", "next": "jail.tscn"}
		]
	},
	"neutral.tscn": {
		"question": "You managed to move on, but now she is asking for another date?",
		"options": [
			{"text": "Agree to a second date", "next": "bad_end.tscn"},
			{"text": "Run away", "next": "bad_end.tscn"},
			{"text": "Panic", "next": "good_end.tscn"},
			{"text": "Propose marrige", "next": "bad_end.tscn"}
		]
	},
	"argument.tscn": {
		"question": "The whole coffee shop is looking at you, what do you do?",
		"options": [
			{"text": "try to calm everyone down", "next": "good_end.tscn"},
			{"text": "run away", "next": "good_end.tscn"},
			{"text": "panic", "next": "good_end.tscn"},
			{"text": "blame your date", "next": "bad_end.tscn"}
		]
	}
}

var scene_tscn = {
	"phone.tscn": preload("res://phone.tscn"),
	"distraction.tscn": preload("res://distraction.tscn")
}

func _ready():
	$prompt.visible = false
	$title_screen/background/start.pressed.connect(_start_game)
	
func _start_game():
	$prompt.visible = true
	$prompt.init_scene_data(scene_text, scene_tscn)
	$prompt.init_scene("phone.tscn")

















