extends Control

var scenes
var options

func init_scene(scene):
	options = self.find_children("opt*")
	$question.text = scene.question
	for i in range(0, len(scene.options)):
		options[i].text = scene.options[i].text
		
		# send next scene to _option_selected when button is pressed
		options[i].pressed.connect(_option_selected.bind(scene.options[i].next))

func _option_selected(next_scene):
	print("Switching to ", next_scene)
	if next_scene in scenes:
		init_scene(scenes[next_scene])
