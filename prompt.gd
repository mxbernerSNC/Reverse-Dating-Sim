extends Control

func ask_question(scene):
	var options = self.find_children("opt*")
	$question.text = scene.question
	for i in range(0, len(scene.options)):
		# update text 
		options[i].text = scene.options[i].text
		# update handler
		options[i].disconnect("pressed", _option_selected)
		options[i].pressed.connect(_option_selected.bind(
			scene.options[i].next,
			scene.options[i].affection
		))

# handler for when an option button is pressed
func _option_selected(next_scene, affection_change):
	print("Switching to ", next_scene)
	
	# update affection and play next scene
	self.get_parent().change_affection(affection_change) 
	self.get_parent().play_scene(next_scene)
