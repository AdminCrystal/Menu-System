extends Node


var standard_controls_key_verification: String
var dvorak_controls_key_verification: String





# will only run if it is not a release build
func _ready() -> void:
	if OS.is_debug_build():
		# will always create new preferences for testing
		Preferences.create_preferences()
		
		# will create a brand new scene for the controls and labels
		# that are used in the custom controls section
		create_labels_and_buttons()
	else:
		load_labels_and_buttons()

func create_labels_and_buttons() -> void:
	# gets the location where to create the labels and buttons
	var labels: VBoxContainer = $"/root/SettingsMenu/VBoxContainer/SettingsRow/ControlsScroller/ControlsContainer/Labels"
	var controls: VBoxContainer = $"/root/SettingsMenu/VBoxContainer/SettingsRow/ControlsScroller/ControlsContainer/Controls"
	var ControlLabel := load("res://Menus/ControlsLabel.tscn")
	var ControlButton := load("res://Menus/ControlsButton.tscn")
	
	# will create a new label and button for every key in the 
	# controls file
	for key in Controls.controls.keys():
		# creates a new instance of the default labels and buttons
		var label_instance: Control = ControlLabel.instance()
		var control_instance: Control = ControlButton.instance()
		
		labels.add_child(label_instance)
		
		var child: Control = labels.get_node("ControlsLabel")
		var childs_label: Label = child.get_node("Label") as Label
		childs_label.text = key.capitalize()
		child.name = key
		# has to set owners or else they would not be saved
		childs_label.set_owner(labels)
		child.set_owner(labels)
		
		controls.add_child(control_instance)
		
		var other_child = controls.get_node("ControlsButton")
		other_child.name = key
		other_child.text = Controls.controls[key]
		# must set owner or it wont save
		other_child.set_owner(controls)
		
	# saves the files to be used in a release build
	var labels_scene: PackedScene = PackedScene.new()
	var controls_scene: PackedScene = PackedScene.new()
	var _error := labels_scene.pack(labels)
	_error = controls_scene.pack(controls)
	
	_error = ResourceSaver.save("res://Menus/generated_labels.tscn", labels_scene)
	_error = ResourceSaver.save("res://Menus/generated_controls.tscn", controls_scene)


func check_for_issues() -> void:
	# automatically signalled after creation of controls
	var hash1: String = standard_controls_key_verification.sha256_text()
	var hash2: String = dvorak_controls_key_verification.sha256_text()
	
	if hash1 != hash2:
		print('ERROR... You have different dictionary keys in Controls.gd ' + 
				'create_standard_controls and create_dvorak_controls')
				
	# clear up some memory :D
	standard_controls_key_verification = ""
	dvorak_controls_key_verification = ""


func load_labels_and_buttons() -> void:
	# will load the last generated lables and buttons for the controls menu
	# this is faster than generating a new one everytime a player plays the game
	var container: HBoxContainer = $"/root/SettingsMenu/VBoxContainer/SettingsRow/ControlsScroller/ControlsContainer"
	
	for child in container.get_children():
		container.remove_child(child)
		
	var labels: Control = load("res://Menus/generated_labels.tscn").instance()
	var buttons: Control = load("res://Menus/generated_controls.tscn").instance()
	
	container.add_child(labels)
	container.add_child(buttons)
		
	
	
	
	
	
