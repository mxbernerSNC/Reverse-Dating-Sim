extends Control

var scene_text

func dialogue(scene):
	pass

func ask_question(scene):
	# update prompt
	var options = self.find_children("opt*")
	$question.text = scene.question
	for i in range(0, len(scene.options)):
		# update text 
		options[i].text = scene.options[i].text
		# disconnect button from previous scene
		options[i].disconnect("pressed", _option_selected)
		# connect button to _option_selected with next_scene parameter
		options[i].pressed.connect(_option_selected.bind(scene.options[i].next))
		

func _option_selected(next_scene):
	print("Switching to ", next_scene)
	
	# play next_scene
	self.get_parent().play_scene(next_scene)
