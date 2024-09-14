extends Position2D

var enemy = preload("res://Enemy_1/Enemy1.tscn")

signal instance_node(node, location)

func _on_Timer_timeout():
	randomize()
	emit_signal("instance_node", enemy, Vector2(180, rand_range(10,80)))
	
