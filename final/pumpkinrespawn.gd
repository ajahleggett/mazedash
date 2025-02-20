extends Node2D


var pumpkin_scene = preload("res://monsters/Pumpkin monster.tscn")
var pumpkin = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pumpkin == null: 
		var new_obj = pumpkin_scene.instatiate()
		new_obj.position = position  
		get_parent().add_child(new_obj)
		pumpkin = new_obj
	pass
