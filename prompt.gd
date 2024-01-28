extends Control

var phone_scene = preload("res://phone.tscn").instantiate()

var scenes
var options

func init_scene(scene_name):
	self.get_parent().add_child(phone_scene) # add tscn

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
	phone_scene.queue_free()
	print("Switching to ", next_scene)
	if next_scene in scenes:
		init_scene(next_scene)
