extends Control

var scene_tscn
var scene_text
var curr_scene

func init_scene_data(scene_text_data, scene_tscn_data):
	scene_tscn = scene_tscn_data
	scene_text = scene_text_data

func init_scene(scene_name):
	# instance tscn file
	if scene_name in scene_tscn:
		curr_scene = scene_tscn[scene_name].instantiate()
		self.get_parent().add_child(curr_scene)

	# update prompt
	var scene = scene_text[scene_name]
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
	# remove previous scene
	curr_scene.queue_free()
	# init next_scene
	if next_scene in scene_text:
		init_scene(next_scene)
