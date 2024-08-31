extends Position2D

var enemy = preload("res://Scenes/Enemy1.tscn")

signal create_enemy(enemy, location)

func _on_Timer_timeout():
	randomize()
	emit_signal("create_enemy", enemy, Vector2(180, rand_range(10,80)))
	
