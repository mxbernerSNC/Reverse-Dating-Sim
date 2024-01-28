extends Control

var scene_tscn
var scenes
var options
var curr_scene

func init_scene(scene_name):
	# instance tscn file
	if scene_name in scene_tscn:
		curr_scene = scene_tscn[scene_name].instantiate()
		self.get_parent().add_child(curr_scene)

	# update prompt
	var scene = scenes[scene_name]
	options = self.find_children("opt*")
	$question.text = scene.question
	for i in range(0, len(scene.options)):
		# update text 
		options[i].text = scene.options[i].text
		# disconnect buttons from previous scene
		options[i].disconnect("pressed", _option_selected)
		# connect button to _option_selected with next scene
		options[i].pressed.connect(_option_selected.bind(scene.options[i].next))

func _option_selected(next_scene):
	# remove previous scene
	curr_scene.queue_free()
	
	# init next_scene
	print("Switching to ", next_scene)
	if next_scene in scenes:
		init_scene(next_scene)
