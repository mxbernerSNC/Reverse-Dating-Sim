extends Node2D

var scenes = {
	"phone.tscn": {
		"question": "The date starts in an hour... What will you do?",
		"options": [
			{"text": "Take a long bath", "next": "distraction.tscn"},
			{"text": "Take a one hour nap", "next": "distraction.tscn"},
			{"text": "Roll around in mud", "next": "distraction.tscn"},
			{"text": "Play your favorite video game", "next": "distraction.tscn"}
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



func _ready():
	$prompt.scenes = scenes
	$prompt.init_scene("phone.tscn")
