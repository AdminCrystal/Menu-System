extends HBoxContainer




# Called when the node enters the scene tree for the first time.
#func _ready():
#	return
#	var labels: VBoxContainer = $Labels
#	var controls: VBoxContainer = $Controls
#	var ControlLabel := load("res://Menus/ControlsLabel.tscn")
#	ControlLabel.set_local_to_scene(true)
#	var ControlButton := load("res://Menus/ControlsButton.tscn")
#	for key in Controls.controls.keys():
#		var label_instance: Control = ControlLabel.instance()
#		var control_instance: Control = ControlButton.instance()
#		labels.add_child(label_instance)
#		var child: Control = labels.get_node("ControlsLabel")
#		var childs_label: Label = child.get_node("Label") as Label
#		childs_label.text = key.capitalize()
#		child.name = key
#		childs_label.set_owner(labels)
#		child.set_owner(labels)
#
#		controls.add_child(control_instance)
#		var other_child = controls.get_node("ControlsButton")
#		other_child.name = key
#		other_child.text = Controls.controls[key]
#		other_child.set_owner(controls)
#
#
#	var labels_scene: PackedScene = PackedScene.new()
#	var controls_scene: PackedScene = PackedScene.new()
#	var _error := labels_scene.pack(labels)
#	_error = controls_scene.pack(controls)
#
#	_error = ResourceSaver.save("res://Menus/generated_labels.tscn", labels_scene)
#	_error = ResourceSaver.save("res://Menus/generated_controls.tscn", controls_scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
