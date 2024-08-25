extends Node2D

func _on_Player_create_bullet(bullet, location):
	var bullet_instance = bullet.instance()
	add_child(bullet_instance)
	bullet_instance.global_position = location
