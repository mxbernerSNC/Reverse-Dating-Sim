extends Node2D

var scenes = {
	"intro_scene.tscn": {
		"question": "what is the winning position in a race?",
		"options": [
			{"text": "first", "next": "first_scene.tscn"},
			{"text": "second", "next": "second_scene.tscn"},
			{"text": "third", "next": "second_scene.tscn"},
			{"text": "fourth", "next": "second_scene.tscn"}
		]
	},
	"first_scene.tscn": {
		"question": "Correct!!! now what?",
		"options": [
			{"text": "fifth", "next": "fifth.tscn"},
			{"text": "sixth", "next": "sixth.tscn"},
			{"text": "seventh", "next": "seventh.tscn"},
			{"text": "eigth", "next": "eigth.tscn"}
		]
	},
	"second_scene.tscn": {
		"question": "wrong answer!!! which position is last?",
		"options": [
			{"text": "ninth", "next": "ninth.tscn"},
			{"text": "tenth", "next": "tenth.tscn"},
			{"text": "eleventh", "next": "eleventh.tscn"},
			{"text": "twelveth", "next": "twelveth.tscn"}
		]
	}
}

func _ready():
	$prompt.scenes = scenes
	$prompt.init_scene(scenes["intro_scene.tscn"])
