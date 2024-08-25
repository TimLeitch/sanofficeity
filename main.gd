extends Control



@export var label : Label
@export var button_label : Label

var count : int 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = "This is the text"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	count += 1
	button_label.text = "Count %s" %count
	
