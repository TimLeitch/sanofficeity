class_name generators
extends Control


# Exports
@export var name_label: Label
@export var qty_label: Label
@export var description_label: Label
@export var effect_label: Label
@export var resource_timer: Timer

@export var buy1: Button
@export var buy10: Button
@export var buy100: Button
@export var buymax: Button

var company_money: float
@export var integrity : float = 1000
var qty: float
var value: float
var cost: float
var effect: float
var buy_amount: int


func update_labels() -> void:
	var effect : float = qty * value

	qty_label.text = "QTY: %s" %qty
	effect_label.text = "%s/s" %effect
	
	
func generate_resource() -> void:
	company_money += qty * value
	integrity += cost * qty
	

func buy_resource(amount) -> void:
	integrity -= cost * amount
	qty += amount
	value += effect * amount
	update_labels()
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_tick() -> void:
	generate_resource()
		
		
		
		
func _on_buy_1_pressed() -> void:
	if integrity > cost:
		buy_resource(1)
		


func _on_buy_10_pressed() -> void:
	if integrity > cost:
		buy_resource(10)


func _on_buy_100_pressed() -> void:
	if integrity > cost:
		buy_resource(100)


func _on_buymax_pressed() -> void:
	if integrity > cost:
		buy_amount 	= integrity / cost 
		buy_resource(buy_amount)
	
	
