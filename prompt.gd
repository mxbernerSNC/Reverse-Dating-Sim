extends Control

var options
var question

var scenes = {
	"example_scene.tscn": {
		"question": "what is the winning position in a race?",
		"options": [
			{"text": "first", "next": "first_scene.tscn"},
			{"text": "second", "next": "second_scene.tscn"},
			{"text": "third", "next": "third_scene.tscn"},
			{"text": "fourth", "next": "fourth_scene.tscn"}
		]
	},
	"first_scene.tscn": {
		"question": "can you answer this question?",
		"options": [
			{"text": "asdf", "next": "fifth_scene.tscn"},
			{"text": "qwer", "next": "sixth_scene.tscn"},
			{"text": "zxcv", "next": "seventh_scene.tscn"},
			{"text": "vbnm", "next": "eigth_scene.tscn"}
		]
	}
}

func _ready():
	options = self.find_children("opt*")
	question = self.find_child("question")
	
	init_scene(scenes["example_scene.tscn"])

func init_scene(scene):
	question.text = scene.question
	for i in range(0, len(scene.options)):
		options[i].text = scene.options[i].text
		options[i].pressed.connect(_option_selected)

func _option_selected():
	# load next scene
	# init_scene(option.next)
	print("next scene")
	init_scene(scenes["first_scene.tscn"])
	pass
